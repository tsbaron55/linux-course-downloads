# CIS255 root setup scripts — public HTTPS validation

`setup-container-labs.sh` and `setup-vm-labs.sh` in this root folder are public technical-test copies from private source `tsbaron55/linux-course-dev`, under `distribution/`. Compare bytes/hashes to the matching exact private Git blob before runtime tests.

The container script installs the existing **Podman LAB framework**, not Podman itself. It uses frozen `pilot-2026-10-12` OCI archives and the `labs-0.1.1` catalog. Rootless Podman must already work on Rocky 10.2. Logic was independently tested; the public filename changes the usage message only.

The VM script checks SHA-256 of the combined native M2 `0.1.0` package before installing into a new `~/cis255` directory, with no sudo/Podman. It refuses any existing directory or symlink and stages the extraction in a temporary directory. Local mocked-download positive/repeat/symlink/bad-SHA tests passed; actual anonymous GitHub HTTPS delivery and Rocky execution still require independent review.

For both tests, use anonymous `curl -fL -o NAME URL`, examine/download the whole Bash file and run `bash NAME`. **Do not pipe remote content to a shell**, run either installer with sudo, delete existing student/VM work, modify Podman images or test on a shared production host. Record exact commit, script SHA-256, test identity, HTTP/TLS, archives, results and leftovers. Re-run checksum and install smoke tests at the final Schoolcraft URL before classroom use.

The immutable native bundle is under `m2-native-0.1.0/cis255-native-labs-0.1.0.tar.gz` (SHA-256 `41bcf115cc455b597cd5afa3004dc132b5e7fcedd3d849460b045db7877dbf6e`). The original M2 Try It and Prove It archives remain in that directory and unchanged.
