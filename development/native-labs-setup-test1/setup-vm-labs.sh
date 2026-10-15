#!/usr/bin/env bash
set -euo pipefail

# Temporary public-HTTPS test; replace URL and SHA-256 for the approved Schoolcraft release.
URL="https://raw.githubusercontent.com/tsbaron55/linux-course-downloads/main/development/native-labs-setup-test1/cis255-native-labs-0.1.0-test1.tar.gz"
SHA256="52c1212202346148ebe882e201053fb6ac7f5ef99e66c960af878df3f014d186"
ARCHIVE="$(mktemp)"
trap 'rm -f "$ARCHIVE"' EXIT

if [[ -e "$HOME/cis255" || -L "$HOME/cis255" ]]; then
    echo "Existing ~/cis255 directory. Nothing changed." >&2
    exit 1
fi

curl -fLsS --retry 2 --connect-timeout 15 "$URL" -o "$ARCHIVE"
printf '%s  %s\n' "$SHA256" "$ARCHIVE" | sha256sum -c -
tar -xzf "$ARCHIVE" -C "$HOME" --no-same-owner

echo "VM labs installed. Type: cd ~/cis255"
