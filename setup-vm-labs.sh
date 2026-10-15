#!/usr/bin/env bash
# One-time native VM activity setup. No sudo or Podman required.
set -euo pipefail
[[ $# == 0 ]] || { echo 'Usage: bash setup-vm-labs.sh' >&2; exit 2; }
[[ $(id -u) != 0 ]] || { echo 'Run as your regular Rocky user, not with sudo.' >&2; exit 2; }
for cmd in curl sha256sum tar gzip mktemp mv; do
  command -v "$cmd" >/dev/null || { echo "Missing command: $cmd" >&2; exit 2; }
done

root="$HOME/cis255-native"
[[ ! -e "$root" && ! -L "$root" ]] || {
  echo "Existing $root detected; nothing changed. Ask your instructor before reinstalling." >&2
  exit 2
}
if [[ -e "$HOME/cis255" || -L "$HOME/cis255" ]]; then
  echo 'An older ~/cis255 installation exists; no automatic migration. Contact instructor.' >&2
  exit 2
fi
url='https://raw.githubusercontent.com/tsbaron55/linux-course-downloads/80837fdb2e9a722ac4e5d996aed2cd491dfda6b7/m2-native-0.1.1-repack1/cis255-native-labs-0.1.1.tar.gz'
sha256='0931f48cabc4953bfee67defaf91024fee3e02f723f214873473ea3c1d3dfe4c'
tmp="$(mktemp -d "$HOME/.cis255-setup.XXXXXXXX")"
trap 'rm -rf -- "$tmp"' EXIT
curl -fLsS --retry 2 --connect-timeout 15 "$url" -o "$tmp/bundle.tar.gz"
printf '%s  %s\n' "$sha256" "$tmp/bundle.tar.gz" | sha256sum -c -
gzip -t "$tmp/bundle.tar.gz"
tar -xzf "$tmp/bundle.tar.gz" -C "$tmp" --no-same-owner
for name in m2-tryit/m2-tryit-start.sh m2-tryit/m2-tryit-check.sh m2-tryit/m2-tryit-reset.sh \
            m2-proveit/m2-proveit-start.sh m2-proveit/m2-proveit-check.sh m2-proveit/m2-proveit-reset.sh; do
  [[ -f "$tmp/cis255-native/$name" && ! -L "$tmp/cis255-native/$name" ]] || { echo "Incomplete archive: $name" >&2; exit 1; }
done
[[ ! -e "$root" && ! -L "$root" ]] || { echo 'Existing installation appeared; nothing changed.' >&2; exit 2; }
mv -T -- "$tmp/cis255-native" "$root"
echo "Native VM activities installed in $root. Read the M2 student instructions before starting."
