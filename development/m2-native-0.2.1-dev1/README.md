# CIS255 Module 2 native Rocky VM — development-test artifacts

**Status: development-test candidate `0.2.1-dev1`, not classroom-approved.**

These are small, complete, native Rocky Linux VM activity archives. They are
**not** Podman activities and **not** part of the previously accepted
`labs-0.1.1` bundle. Existing release assets, student installer, updater,
container images, and `catalog.tsv` are unchanged.

Source of truth: private `tsbaron55/linux-course-dev`, exact source commit
`1c5eeca56da930971501eba91a49ae4512f35cc2`, under `native/m2/`.
Follow `AGENTS.md`, `native/m2/README.md`, `native/m2/TEST_PLAN.md`,
`native/m2/TEST_REPORT.md`, and `native/m2/VALIDATION-2026-10-15.md`.

## Development downloads

| Filename | Bytes | SHA-256 |
| --- | ---: | --- |
| `cis255-m2-tryit-0.2.1-dev1.tar.gz` | 1,645 | `35f002df10087fbc13a88b48bfee05164f4ad0249cee86e1574bf21153f55d8a` |
| `cis255-m2-proveit-0.2.1-dev1.tar.gz` | 2,883 | `cfdd3889af4b96538c5902eb5083613d4aca01b97a4f115d953352dd44c584c2` |
| `SHA256SUMS.m2-native` | 202 | `ab95f1f8d51a11a33cb1629020cee4085421b5e48b5cae0594bf1df63f381274` |

The manifest covers both archives. Verify `sha256sum -c SHA256SUMS.m2-native`
**after downloading both archives** and before extracting either.

Artifacts are temporarily stored as Git-tracked, versioned development files
because the available GitHub integration can commit binary Git objects but
does not expose GitHub Release asset upload. **This directory is not a GitHub
Release.** Do not substitute it for the established production release workflow.

## Exact Linux download/extraction commands

Use an ordinary Rocky Linux user. Get all three candidate files from this
directory. Download URLs under `raw.githubusercontent.com` can be pinned to
the exact public distribution commit once that commit is established.

```bash
cd ~/Downloads
sha256sum -c SHA256SUMS.m2-native
gzip -t cis255-m2-tryit-0.2.1-dev1.tar.gz cis255-m2-proveit-0.2.1-dev1.tar.gz
tar -xzf cis255-m2-tryit-0.2.1-dev1.tar.gz -C "$HOME"
bash ~/cis255/m2-tryit/start.sh
bash ~/cis255/m2-tryit/check.sh
bash ~/cis255/m2-tryit/reset.sh
tar -xzf cis255-m2-proveit-0.2.1-dev1.tar.gz -C "$HOME"
sudo bash ~/cis255/m2-proveit/start.sh
sudo bash ~/cis255/m2-proveit/check.sh
sudo bash ~/cis255/m2-proveit/reset.sh
```

**Privileged testing requires the instructor's explicit authorization on a
dedicated course VM.** Never run on a shared/production system. Do not
`sudo tar` or `sudo touch` student acknowledgment files.

## Independent acceptance

See `CODEX-TESTING.md` in this directory. No actual Rocky Linux 10.2 VM
acceptance or independently verified public download has been claimed here.
