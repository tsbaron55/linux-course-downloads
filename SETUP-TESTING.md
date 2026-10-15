## Issue #1 combined archive correction — pending new independent regression

Source commit `38c87910966b9cd9e902e3a00abf55b4fc9ad544` includes the M2 packager fix and report-only private Git submission guidance in `AGENTS.md`. Its native installer is pinned to corrected immutable `m2-native-0.1.1-repack1/cis255-native-labs-0.1.1.tar.gz` from public commit `80837fdb2e9a722ac4e5d996aed2cd491dfda6b7`, 3,914 bytes, SHA-256 `0931f48cabc4953bfee67defaf91024fee3e02f723f214873473ea3c1d3dfe4c`. Codex must independently rebuild, verify anonymous HTTPS and new-path install, run focused lifecycle checks, preserve historical data, and publish a Markdown report on a separate private Git report branch. Privileged Prove It testing requires separate express instructor approval and must otherwise remain BLOCKED. This is not yet a passed regression.

## Issue #1 path-only candidate (pending independent Codex)

The new root script copies come from private source `a4715994272297895c13150d29d7dbec59b50e29` (see private Issue #1). `setup-container-labs.sh` targets `~/cis255-containers/` and preserves the accepted container framework and bundle. `setup-vm-labs.sh` targets `~/cis255-native/`, verifies and extracts immutable `m2-native-0.1.1/cis255-native-labs-0.1.1.tar.gz` pinned to public commit `8d015d01a51a4f974eb153efc1df31dc98aede01`, SHA-256 `8e02b4611e77859e5b5f75e8372fe585b14e03f85b51172f78058beab97bfbba`. Earlier setup testing and narrative below refer to the previously accepted old paths and are HISTORICAL; both new scripts still require fresh independent Rocky/HTTPS and preserve-work testing.

# CIS255 root setup scripts — public HTTPS validation

`setup-container-labs.sh` and `setup-vm-labs.sh` in this root folder are public technical-test copies from private source `tsbaron55/linux-course-dev`, under `distribution/`. Compare bytes/hashes to the matching exact private Git blob before runtime tests.

The container script installs the existing **Podman LAB framework**, not Podman itself. It uses frozen `pilot-2026-10-12` OCI archives and the `labs-0.1.1` catalog. Rootless Podman must already work on Rocky 10.2. Logic was independently tested; the public filename changes the usage message only.

The VM script checks SHA-256 of the combined native M2 `0.1.0` package before installing into a new `~/cis255` directory, with no sudo/Podman. It refuses any existing directory or symlink and stages the extraction in a temporary directory. Local mocked-download positive/repeat/symlink/bad-SHA tests passed; actual anonymous GitHub HTTPS delivery and Rocky execution still require independent review.

For both tests, use anonymous `curl -fL -o NAME URL`, examine/download the whole Bash file and run `bash NAME`. **Do not pipe remote content to a shell**, run either installer with sudo, delete existing student/VM work, modify Podman images or test on a shared production host. Record exact commit, script SHA-256, test identity, HTTP/TLS, archives, results and leftovers. Re-run checksum and install smoke tests at the final Schoolcraft URL before classroom use.

The immutable native bundle is under `m2-native-0.1.0/cis255-native-labs-0.1.0.tar.gz` (SHA-256 `41bcf115cc455b597cd5afa3004dc132b5e7fcedd3d849460b045db7877dbf6e`). The original M2 Try It and Prove It archives remain in that directory and unchanged.
