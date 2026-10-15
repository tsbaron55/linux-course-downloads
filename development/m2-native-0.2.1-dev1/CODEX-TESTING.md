# Independent Codex/Work acceptance — M2 native development candidate

**Role: independent read-only tester. No edits, fixes, commits, release
publication, or privilege escalation without instructor authorization.**

1. Obtain access to the private source repo and check out EXACTLY
   `1c5eeca56da930971501eba91a49ae4512f35cc2`.
2. Read `AGENTS.md`, `README.md`, `native/m2/README.md`,
   `native/m2/TEST_PLAN.md`, `native/m2/TEST_REPORT.md`,
   `native/m2/VALIDATION-2026-10-15.md`, and `native/m2/package-m2.sh`.
3. Clone/download the public distribution repository at the exact public
   commit supplied by the instructor, using this directory
   `development/m2-native-0.2.1-dev1/`. Do not use an unpinned `main`
   checkout without recording the resolved full public commit.
4. Download all three assets **anonymously via HTTPS**, if network access
   allows; verify HTTP status, TLS, bytes, `sha256sum -c`, and `gzip -t`.
   Do not treat authenticated Git API reads as anonymous delivery verification.
   Archive SHA-256 values:
   - Try It `35f002df10087fbc13a88b48bfee05164f4ad0249cee86e1574bf21153f55d8a`
   - Prove It `cfdd3889af4b96538c5902eb5083613d4aca01b97a4f115d953352dd44c584c2`
5. Rebuild privately from `native/m2/package-m2.sh` twice in fresh directories,
   compare the two builds with each other and against these published
   artifact SHA-256 values. Check archive member paths, extraction modes,
   student-only files, the hidden-ticket fixture, and absence of instructor notes.
6. On a dedicated **Rocky Linux 10.2 course VM** and separate ordinary test
   identity/workspace, follow the checked-in test plan. Test Try It start,
   incomplete/incorrect/correct checking, repeated start/check, reset/restart,
   invalid files, symlinks, modified fixture, and non-destructive scope.
   Prove It tests require **specific prior instructor authorization for sudo**:
   root-only directory `0700`, root-owned reports `0600`, denied normal access,
   authorized `sudo ls -lt`, uniquely newest report, wrong/correct acknowledgment,
   repeated operations, tampered report and timestamp, symlinks/unexpected objects,
   bounded reset, sudo denied, and login-shell entry/exit as allowed by the VM.
7. Return a test report with commands, exit codes, errors, actual OS/version,
   account and sudo policy, exact source/public commits, package sizes and SHA-256,
   results for each case, recovery/cleanup, and remaining blockers.
   Distinguish `PASS`, `FAIL`, `BLOCKED`, `NOT TESTED`.
   **Do not edit scripts to make the tests pass**; report failures to the author.

Previous local Debian GNU/Linux 13 simulation: 43/43 additional checks
passed; this is NOT actual Rocky Linux or independent acceptance.
Panopto evidence of documentation use, command construction,
administrative access, and entering/exiting a root shell remains part
of the instructor's assessment, separate from the state checker.
