# Intro to Linux — frozen image delivery pilot (2026-10-12)

**Prerelease; technical test only — not for classroom use.**

These are the two **exact OCI image archives** previously exported and independently tested on Rocky Linux 10.2. They are published temporarily to validate direct HTTPS downloads and student-style rootless Podman setup before moving to college-managed hosting.

Files: `rocky-10.2-poc02.oci.tar.gz`, `ubuntu-24.04-poc02.oci.tar.gz`, and `SHA256SUMS.images`. Compare the archives against the SHA-256 hashes in the repository's [manifest](https://github.com/tsbaron55/linux-course-downloads/blob/main/RELEASE-MANIFEST.md) before loading.

- Rocky compressed image: 91,912,391 bytes, SHA-256 `62b6b36b7fda2ec36fe9c4be9bfbc8eb19deb4e197294f0711c9a0bd33a9461b`.
- Ubuntu compressed image: 35,924,653 bytes, SHA-256 `f9ed2ab3c2521be9090c7da10e16f286235d98d64c16a280603a787c2d97e731`.
- Independent test commit: `7b8f67d65c3e19bfd2054ea5f011b6b1643b70eb`. Runtime baseline commit: `8e756c16d4a61f38e116d106f3a29a271f21cc4a`.

**Not yet validated:** external downloads and end-to-end student onboarding. Do not distribute this prerelease to students as a graded lab.
