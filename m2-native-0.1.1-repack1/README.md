# M2 0.1.1 — corrected combined native installer archive (technical test candidate)

Independent Rocky testing found the original `m2-native-0.1.1/cis255-native-labs-0.1.1.tar.gz` (3,920 bytes) contained a top-level `cis255-native/` directory header with mode `2755`. It is preserved unchanged. This separately staged correction sets the header to `0755`, producing reproducible compressed bytes, without modifying the individual M2 archives or their contained student files.

- Corrected combined archive: `cis255-native-labs-0.1.1.tar.gz`.
- Bytes: **3,914**.
- SHA-256: `0931f48cabc4953bfee67defaf91024fee3e02f723f214873473ea3c1d3dfe4c`.
- Original combined archive (historical): 3,920 bytes, SHA-256 `8e02b4611e77859e5b5f75e8372fe585b14e03f85b51172f78058beab97bfbba`.
- The corrected archive was produced twice with GNU tar deterministic options and gzip -n -9, byte-identically. All 18 tar members were compared with the old combined archive; only the root directory mode differed.
- Underlying individual candidate archives still live in `m2-native-0.1.1/`; they retain their existing checksums and are not duplicated or replaced.
- Private source packager `native/m2/package-m2.sh` now includes combined archive production and directory permission normalization.

This is an immutable **technical test** candidate, not an independently Rocky-approved classroom release. Independent Codex must rebuild from the exact source commit and verify identical bytes and anonymous HTTPS before instructor acceptance.
