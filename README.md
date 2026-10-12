# Intro to Linux — temporary download mirror

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
