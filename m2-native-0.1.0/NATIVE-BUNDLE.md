# CIS255 native VM installer bundle 0.1.0

This immutable combined archive contains the two instructor-accepted M2 native VM activities. It is for testing the one-time `setup-vm-labs.sh` installer over public HTTPS before the migration to the college's Schoolcraft host. Not a separate activity version or a GitHub Release asset.

- File: `cis255-native-labs-0.1.0.tar.gz`
- Bytes: **3,903**
- SHA-256: `41bcf115cc455b597cd5afa3004dc132b5e7fcedd3d849460b045db7877dbf6e`
- Input archive SHA-256: Try It `cb149c69300809e3df60be4185869103bed7d900493bf50e9fe122bc5b6ded76` and Prove It `72b2b4243447ab07476e5f6a5f28c5fd36041aac201044f97e78226df75b83f5`.
- Combined archive is reproducible (two builds identical); the `cis255/` tree contains precisely `m2-tryit/` and `m2-proveit/`, with student-only scripts and fixtures.
- Source: private `linux-course-dev` M2 0.1.0, commit `86c44ab2dd88e9edaa11e1897e46e013e7100d35`.

This package is **not** the Podman container lab bundle and is not installed into `~/linux-course`. Use an ordinary student account, not `sudo tar`. Independently test anonymous HTTPS delivery from the final pinned public commit and later from the Schoolcraft host.
