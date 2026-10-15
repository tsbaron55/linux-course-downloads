# CIS255 M2 native 0.1.1 — directory-only testing candidate

**NOT approved for classroom delivery.** New archive layout installs as `~/cis255-native/m2-tryit` and `~/cis255-native/m2-proveit`, instead of accepted 0.1.0's `~/cis255`. Private source candidate [6e02b0d](https://github.com/tsbaron55/linux-course-dev/commit/6e02b0d81907d6150f0fbccdd5c16cc0f70e64cc) and private Issue #1 govern the change.

Three reproducible local archives (builds were byte-identical; **not** independently Rocky-validated):

| Candidate | Bytes | SHA-256 |
| --- | ---: | --- |
| cis255-m2-tryit-0.1.1.tar.gz | 1,647 | 7eee85ef4f574d141c3f15c57544a9ad50954450efa6f22a796d3e6473a2c979 |
| cis255-m2-proveit-0.1.1.tar.gz | 2,905 | 3633497fbe9ee2ca43a097ad68d969809a90d7b339cd464257b8c1db4672a9ff |
| cis255-native-labs-0.1.1.tar.gz | 3,920 | 8e02b4611e77859e5b5f75e8372fe585b14e03f85b51172f78058beab97bfbba |

Changes: directory prefix, one exact host-path guard in `_common.sh`, command references and version labels. Six start/check/reset scripts, student scenarios and privileged `/var/lib` report location remain unchanged. No instructor solutions/notes in archives. The original immutable 0.1.0 packages remain available.

These are public Git-tracked **technical test files**, not GitHub Release assets. Record anonymous HTTPS/TLS and SHA-256 checks on Rocky separately. Do not run sudo for extraction/initial setup; Prove It requires specifically authorized sudo for activity actions.
