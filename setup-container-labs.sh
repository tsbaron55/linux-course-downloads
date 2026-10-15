#!/usr/bin/env bash
# One-time student provisioning on an already-configured Rocky 10.2 rootless Podman VM.
# Technical pilot only: never changes host OS packages, identities, or Podman configuration.
set -euo pipefail
[[ $(id -u) != 0 ]] || { echo 'Run as a normal Rocky user, never with sudo.' >&2; exit 2; }
[[ $# == 0 ]] || { echo 'Usage: bash setup-container-labs.sh' >&2; exit 2; }
for cmd in curl sha256sum tar gzip podman mktemp df awk; do
  command -v "$cmd" >/dev/null || { echo "Missing required command: $cmd. Contact instructor." >&2; exit 2; }
done
root="$HOME/linux-course"
if [[ -e $root && ! -f $root/.installed-bundle-version ]]; then
  echo "Refusing to overwrite an unexpected or incomplete existing directory: $root" >&2
  exit 2
fi
catalog_url="${LINUX_COURSE_CATALOG_URL:-https://raw.githubusercontent.com/tsbaron55/linux-course-downloads/main/catalog.tsv}"
release_base="https://github.com/tsbaron55/linux-course-downloads/releases/download/pilot-2026-10-12"
tmp="$(mktemp -d "$HOME/.linux-course-install.XXXXXXXX")"
trap 'rm -rf -- "$tmp"' EXIT
fail() { echo "Installation stopped: $*" >&2; exit 1; }
download_verified() {
  local url="$1" out="$2" bytes="$3" digest="$4"
  curl -fLSs --retry 2 --connect-timeout 15 "$url" -o "$out" || fail "Download failed: $url"
  [[ $(wc -c < "$out" | tr -d ' ') == "$bytes" ]] || fail "Incorrect download size: $(basename "$out")"
  [[ $(sha256sum "$out" | awk '{print $1}') == "$digest" ]] || fail "SHA-256 mismatch: $(basename "$out")"
  gzip -t "$out" || fail "Invalid gzip archive: $(basename "$out")"
}
image_id() {
  local actual
  actual="$(podman image inspect "$1" --format '{{.Id}}' 2>/dev/null)" || return 1
  printf '%s\n' "${actual#sha256:}"
}
ensure_image() {
  local name="$1" bytes="$2" digest="$3" tag="$4" expected_id="$5" local_image="$tmp/$1" actual
  if actual="$(image_id "$tag")"; then
    [[ $actual == "$expected_id" ]] || fail "Unexpected existing image ID for $tag. Will not overwrite."
    echo "Already loaded: $tag"
    return 0
  fi
  echo "Downloading approved image: $name"
  download_verified "$release_base/$name" "$local_image" "$bytes" "$digest"
  podman load -i "$local_image" || fail "Podman could not load $name"
  actual="$(image_id "$tag")" || fail "Loaded image tag was not found: $tag"
  [[ $actual == "$expected_id" ]] || fail "Image ID mismatch after loading $tag"
  echo "Verified and loaded: $tag"
}
echo "Preparing Linux course for user $(id -un); rootless Podman must already work."
podman info >/dev/null || fail 'Podman is unavailable to this user. Contact instructor; no sudo fallback.'
free_kb="$(df -Pk "$HOME" | awk 'END {print $4}')"
[[ $free_kb =~ ^[0-9]+$ ]] || fail 'Could not determine free disk space.'
[[ $free_kb -ge 1048576 ]] || fail 'Less than 1 GiB free: contact instructor before installing.'
ensure_image "rocky-10.2-poc02.oci.tar.gz" 91912391 \
  "62b6b36b7fda2ec36fe9c4be9bfbc8eb19deb4e197294f0711c9a0bd33a9461b" \
  "localhost/linux-course/rocky:10.2-poc02" \
  "52918aa702eb4e630a91836fefafa114426eb0b48ecec1fbcfb823663be09a2c"
ensure_image "ubuntu-24.04-poc02.oci.tar.gz" 35924653 \
  "f9ed2ab3c2521be9090c7da10e16f286235d98d64c16a280603a787c2d97e731" \
  "localhost/linux-course/ubuntu:24.04-poc02" \
  "548ac089f6c8ce5a863c19d6e3f49dbd96f72dc7e8772e049be486cc8218a9a7"
if [[ -f $root/.installed-bundle-version ]]; then
  echo "Existing lab installation preserved (bundle $(cat "$root/.installed-bundle-version"))."
  echo 'To retrieve newer lab definitions when offered, run: lab update'
  exit 0
fi
echo 'Downloading current, versioned lab bundle...'
curl -fLSs --retry 2 --connect-timeout 15 "$catalog_url" -o "$tmp/catalog.tsv" || fail 'Cannot retrieve course catalog.'
rows=0
while IFS=$'\t' read -r kind version bytes digest url extra || [[ -n ${kind:-} ]]; do
  [[ -z $kind || $kind == \#* ]] && continue
  ((rows+=1))
  [[ $kind == bundle && -z ${extra:-} ]] || fail 'Unexpected catalog entry.'
done < "$tmp/catalog.tsv"
[[ $rows == 1 ]] || fail 'Course catalog must contain exactly one bundle.'
IFS=$'\t' read -r kind version bytes digest url < <(grep '^bundle' "$tmp/catalog.tsv")
[[ $version =~ ^[0-9]+(\.[0-9]+){2}$ ]] || fail 'Invalid catalog version.'
[[ $bytes =~ ^[1-9][0-9]*$ && $digest =~ ^[0-9a-f]{64}$ ]] || fail 'Invalid catalog size or checksum.'
[[ $url == https://github.com/tsbaron55/linux-course-downloads/releases/download/*/linux-course-labs-*.tar.gz ]] || fail 'Unexpected course package download host.'
download_verified "$url" "$tmp/bundle.tar.gz" "$bytes" "$digest"
while IFS= read -r member; do
  [[ $member != /* && $member != .. && $member != ../* && $member != */../* && $member != */.. ]] || fail 'Unsafe package path.'
  case "$member" in
    lab|update.sh|BUNDLE_VERSION|FRAMEWORK_VERSION|ACTIVITY_VERSIONS.tsv|activities|activities/|activities/*) ;;
    *) fail "Unexpected package file: $member" ;;
  esac
done < <(tar -tzf "$tmp/bundle.tar.gz")
while IFS= read -r entry; do
  case "${entry:0:1}" in -|d) ;; *) fail 'Course package contains a link or special file.' ;; esac
done < <(tar -tvzf "$tmp/bundle.tar.gz")
mkdir "$tmp/course"
tar -xzf "$tmp/bundle.tar.gz" -C "$tmp/course" --no-same-owner || fail 'Unable to extract lab bundle.'
[[ -f $tmp/course/lab && -f $tmp/course/update.sh && -f $tmp/course/BUNDLE_VERSION && -f $tmp/course/FRAMEWORK_VERSION ]] || fail 'Incomplete lab framework.'
[[ $(cat "$tmp/course/BUNDLE_VERSION") == "$version" ]] || fail 'Bundle internal version does not match the catalog.'
for script in "$tmp/course/lab" "$tmp/course/update.sh"; do
  bash -n "$script" || fail "Invalid framework script: $script"
done
lab_count=0
while IFS=$'\t' read -r act ver extra || [[ -n ${act:-} ]]; do
  [[ $act =~ ^[a-z][a-z0-9-]{0,24}$ && $ver =~ ^[0-9]+(\.[0-9]+){2}$ && -z ${extra:-} ]] || fail 'Invalid lab version record.'
  [[ -f $tmp/course/activities/$act/activity.conf && -f $tmp/course/activities/$act/resources/check.sh ]] || fail "Missing activity files for $act."
  [[ -f $tmp/course/activities/$act/.course-version && $(cat "$tmp/course/activities/$act/.course-version") == "$ver" ]] || fail "Lab version mismatch: $act."
  bash -n "$tmp/course/activities/$act/resources/check.sh" || fail "Invalid checker for $act."
  if [[ -f "$tmp/course/activities/$act/resources/init.sh" ]]; then bash -n "$tmp/course/activities/$act/resources/init.sh" || fail "Invalid setup script for $act."; fi
  ((lab_count+=1))
done < "$tmp/course/ACTIVITY_VERSIONS.tsv"
[[ $lab_count -ge 1 ]] || fail 'Lab package is empty.'
chmod 755 "$tmp/course/lab" "$tmp/course/update.sh"
printf '%s\n' "$version" > "$tmp/course/.installed-bundle-version"
cp "$tmp/course/FRAMEWORK_VERSION" "$tmp/course/.installed-framework-version"
[[ ! -e $root ]] || fail 'An installation directory appeared during setup; refusing to overwrite.'
mv "$tmp/course" "$root" || fail 'Could not install course files.'
echo "Installed bundle $version with $lab_count activity(ies) in $root"
if [[ -e "$HOME/.local/bin/lab" ]]; then
  echo "An existing ~/.local/bin/lab was left untouched. Use: $root/lab"
else
  mkdir -p "$HOME/.local/bin"
  cat > "$HOME/.local/bin/lab" <<'WRAPPER'
#!/usr/bin/env bash
exec "$HOME/linux-course/lab" "$@"
WRAPPER
  chmod 755 "$HOME/.local/bin/lab"
  echo 'Created ~/.local/bin/lab command wrapper.'
fi
if [[ ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
  echo 'Next: lab identify YOUR_BLACKBOARD_USERNAME'
else
  echo "Next: $root/lab identify YOUR_BLACKBOARD_USERNAME"
  echo 'The ~/.local/bin directory is not currently in PATH; no shell settings were changed.'
fi
echo 'Technical pilot only: do not distribute as an approved student release.'
