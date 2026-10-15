# CIS255 Module 2 native VM activities — 0.1.0

**Instructor-approved M2 technical activity version 0.1.0**, based on independent Codex Rocky Linux 10.2 regression PASS: 90/90 checks plus the interactive root-shell demonstration.

This directory is a temporary **public HTTPS testing location**, not the intended permanent classroom host. The plan is to deploy approved student packages on Schoolcraft's HTTPS server and use Blackboard Ultra for course instructions. These are Git-tracked downloads, NOT GitHub Release assets.

Private source: tsbaron55/linux-course-dev (do not expose private source/repository to students).
Tested unmodified exercise source: 81ffd86b21d1b9c9b437c6f273dc1624daa84d72 (0.2.1-dev2).
M2 0.1.0 release preparation source: f550c3e89769abfa221c0345157c40fdf46ccf1e (same executable activity logic; updated version label, packager version rule, student archive names).
Two separate clean builds produced byte-identical output, with package contents compared to the matching private Git blobs. No instructor solutions or notes are present in these student archives.

| Student archive | Bytes | SHA-256 |
| --- | ---: | --- |
| cis255-m2-tryit-0.1.0.tar.gz | 1641 | cb149c69300809e3df60be4185869103bed7d900493bf50e9fe122bc5b6ded76 |
| cis255-m2-proveit-0.1.0.tar.gz | 2899 | 72b2b4243447ab07476e5f6a5f28c5fd36041aac201044f97e78226df75b83f5 |
| SHA256SUMS.m2-native | 192 | 2cc095bea1756a4d2b61458c1e578bf4722abf43a5f87d8ef1880abda7cc2a12 |

Install by extracting each assigned archive **as the ordinary student user**, never sudo-tar. The package contains exactly one activity directory under `cis255/`, including activity-specific `m2-tryit-{start,check,reset}.sh` or `m2-proveit-{start,check,reset}.sh`. Prove It's scripts require student-initiated sudo on the dedicated course Rocky VM; do not execute them on shared/production hosts.

The instructor still controls assignment release, Guided Lab and Panopto evidence, and entire M2 CDM/classroom readiness. Final hosted-file anonymous HTTPS validation is outstanding. This 0.1.0 version is independent of the container framework and lab bundle versions.
