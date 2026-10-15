## Issue #1 — new installation-directory candidate (NOT independently tested)

The current root setup scripts are **new candidate bytes** from private source `a4715994272297895c13150d29d7dbec59b50e29`, to use `~/cis255-containers/` and `~/cis255-native/`. The native installer pins a checksummed 0.1.1 combined package at public commit `8d015d01a51a4f974eb153efc1df31dc98aede01`. Both new paths require independent Rocky testing and instructor acceptance. Prior October 15 validation applied to old `~/linux-course/` and `~/cis255/` and must not be claimed for these new scripts. Old GitHub prereleases and versioned 0.1.0 M2 files remain immutable.

# Intro to Linux — temporary download mirror

## Current setup script test files (October 15, 2026)

Two one-time **student-style installer candidates** are tracked at the repository root: `setup-container-labs.sh` and `setup-vm-labs.sh`. They are intentionally hosted here only for public HTTPS validation before migration to Schoolcraft's college-managed download site. `setup-container-labs.sh` is the previously tested Linux course Podman **lab environment** installer with only the usage text updated. It requires already configured rootless Podman and uses frozen GitHub pilot OCI images plus the current `labs-0.1.1` catalog. `setup-vm-labs.sh` installs the accepted native M2 Try It and Prove It exercises without sudo/Podman from a pinned, checksummed combined package.

The native installer archive is `m2-native-0.1.0/cis255-native-labs-0.1.0.tar.gz` (3903 bytes, SHA-256 `41bcf115cc455b597cd5afa3004dc132b5e7fcedd3d849460b045db7877dbf6e`). Both M2 activities are instructor-accepted at the *technical* level; this is not entire M2 classroom release approval. Final anonymous Rocky testing of these two new public script endpoints and Schoolcraft distribution is pending. See `SETUP-TESTING.md` for review boundaries.

**Status:** Technical pilot only. **Not a released student assignment or supported classroom installer.**

This public repository will temporarily hold frozen container images for development testing of the college's Intro to Linux course. The instructor's working source and test records are maintained separately in a **private** repository. Public access does **not** imply that these pilot images or procedures are ready for students.

## Pilot: `pilot-2026-10-12`

The [public technical prerelease](https://github.com/tsbaron55/linux-course-downloads/releases/tag/pilot-2026-10-12) contains two gzip-compressed OCI image archives plus their SHA-256 checksum manifest.

| File | Bytes | SHA-256 |
|---|---:|---|
| `rocky-10.2-poc02.oci.tar.gz` | 91,912,391 | `62b6b36b7fda2ec36fe9c4be9bfbc8eb19deb4e197294f0711c9a0bd33a9461b` |
| `ubuntu-24.04-poc02.oci.tar.gz` | 35,924,653 | `f9ed2ab3c2521be9090c7da10e16f286235d98d64c16a280603a787c2d97e731` |

These are the **exact development images** independently checked on Rocky Linux 10.2 using rootless Podman 5.8.2 on October 12, 2026. Their local export, integrity verification, clean isolated import, Ubuntu command smoke test, and Rocky permissions reset have passed. **Unauthenticated HTTPS downloads also passed** on Rocky: both image hashes matched, gzip checks passed and the manifest was identical. **Student setup and the full Ubuntu activity lifecycle remain untested.**

### Verifying downloaded archives

Save `SHA256SUMS.images` and both image files in one directory, then run under the ordinary Linux user:

```bash
sha256sum -c SHA256SUMS.images
gzip -t rocky-10.2-poc02.oci.tar.gz ubuntu-24.04-poc02.oci.tar.gz
```

Never load or execute an archive whose checksum does not match. Do not use `sudo podman`; these images were developed for rootless Podman.

**Publishing note:** GitHub Releases assets are live and were independently verified over HTTPS on Rocky without GitHub sign-in. This remains a **development test mirror**, not an approved student installer or grading environment. This repository contains no private source, credentials, or student records.

When the college's managed download service is available, it is expected to replace this temporary host.
