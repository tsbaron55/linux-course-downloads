# Pilot image release manifest

**Release tag:** `pilot-2026-10-12` (publish as GitHub prerelease, pending uploads)  
**Purpose:** Temporary, **public**, developer-testing download mirror; **not student-ready**  
**Validating environment:** Rocky Linux 10.2, Podman 5.8.2 (rootless), October 12, 2026  
**Source/test commit:** `7b8f67d65c3e19bfd2054ea5f011b6b1643b70eb`  
**Unchanged runtime baseline commit:** `8e756c16d4a61f38e116d106f3a29a271f21cc4a`

| Archive | Tag on import | Image ID |
|---|---|---|
| `rocky-10.2-poc02.oci.tar.gz` | `localhost/linux-course/rocky:10.2-poc02` | `52918aa702eb4e630a91836fefafa114426eb0b48ecec1fbcfb823663be09a2c` |
| `ubuntu-24.04-poc02.oci.tar.gz` | `localhost/linux-course/ubuntu:24.04-poc02` | `548ac089f6c8ce5a863c19d6e3f49dbd96f72dc7e8772e049be486cc8218a9a7` |

Archive hashes and exact file sizes appear in [`SHA256SUMS.images`](SHA256SUMS.images) and [README](README.md).

**Archive provenance:** These are prebuilt candidate images exported on the Rocky VM via `delivery/export-candidate.sh`, not output of a later rebuild. The generated VM-side `IMAGE-MANIFEST.txt` said `Git commit: unknown` because Git was unavailable in that VM; the **tested repository revision is explicitly recorded above**. The source tree was transported with LF-preserving `git -c core.autocrlf=false archive`. Recompressing or rebuilding creates different artifacts and requires fresh hashes and test approval.

### Acceptance boundary

Independent Codex report: developer image export and checksum, tampered checksum rejection, isolated import, Ubuntu `student`/`apt-get`/`dpkg` smoke test, Rocky permissions 0/5 reset twice, no image pulls/builds, no default-store mutations: **PASS**.

Pending: public HTTPS download from this new host, student package distribution, setup on a clean VM, subsequent offline reset and complete Ubuntu activity lifecycle. Publishing public release assets is a distinct gate, not automatically evidence that student setup works.
