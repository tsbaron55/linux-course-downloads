# CIS255 screenshot demonstrations 0.1.0

Instructor screenshot tools using fictional native and container Try It and
Prove It examples. They simulate output and a small container prompt; they do
not run Podman, perform assessments, or install real course labs. Use an ordinary
Rocky Linux 10.2 account. No sudo or additional packages are needed.

Archive: `cis255-screenshot-demos-0.1.0.tar.gz` (7,511 bytes).
SHA-256: `a4db548fc6f5b1341a417b6bbba1854f9eb5e59a8d9a3a201612e2f11388b847`.
The checksum manifest is `SHA256SUMS` in this directory.

## Download and extract on a fresh example VM

This block refuses to overwrite an existing `~/cis255-screenshot-demos` folder
or link. Keep existing demonstrations; use a separate fresh extraction directory
if you already have a copy. These are public HTTPS downloads with no GitHub login.

```bash
(
  set -e
  if [[ -e "$HOME/cis255-screenshot-demos" || -L "$HOME/cis255-screenshot-demos" ]]; then
    echo 'Existing screenshot demonstrations preserved; use a fresh extraction directory.' >&2
    exit 1
  fi
  download_dir=$(mktemp -d "$HOME/cis255-demo-download.XXXXXXXX")
  cd "$download_dir"
  base='https://raw.githubusercontent.com/tsbaron55/linux-course-downloads/main/screenshot-demos/0.1.0'
  curl -q --fail --show-error --location --proto '=https' --proto-redir '=https' \
    "$base/cis255-screenshot-demos-0.1.0.tar.gz" -o cis255-screenshot-demos-0.1.0.tar.gz
  curl -q --fail --show-error --location --proto '=https' --proto-redir '=https' \
    "$base/SHA256SUMS" -o SHA256SUMS
  sha256sum -c SHA256SUMS
  gzip -t cis255-screenshot-demos-0.1.0.tar.gz
  tar --keep-old-files --no-same-owner -xzf cis255-screenshot-demos-0.1.0.tar.gz -C "$HOME"
)
```

The archive contains one top-level `cis255-screenshot-demos/` directory, with
`native/`, `containers/`, the existing instructor controls, README, and smoke tests.
All demonstration scripts are preserved unchanged. Private validation records,
Git metadata, credentials, temporary files and local progress are excluded.
The bundled original README's reference to `VALIDATION.md` points to an
instructor record intentionally omitted from this public package.

## Container Try It screenshots

```bash
cd ~/cis255-screenshot-demos
./containers/lab identify exampleuser
./containers/lab list
./containers/lab start example-tryit
```

At the simulated container prompt, type:

```text
check
exit
```

Back at the Rocky host prompt, choose a successful demonstration and reenter:

```bash
bash demo-control.sh container-tryit pass
./containers/lab start example-tryit
```

Type `check` (PASS), then `exit`. At the host prompt:

```bash
./containers/lab check example-tryit
./containers/lab reset example-tryit
./containers/lab check example-tryit
```

Reset restores NOT YET. The incomplete host-side check returns exit code 1;
this is expected feedback. Exiting and reentering preserves demonstration state.

## Fictional container Prove It screenshots

From the same identified demo folder:

```bash
./containers/lab start example-proveit
```

Type `check` (NOT YET), then `exit`. At the host prompt:

```bash
bash demo-control.sh container-proveit pass
./containers/lab start example-proveit
```

Type `check` (PASS plus evidence reminder), then `exit`. At the host prompt:

```bash
./containers/lab check example-proveit
./containers/lab reset example-proveit
./containers/lab check example-proveit
```

`bash demo-control.sh reset-all` clears this demo copy's four progress values
and example identity. `bash tests/smoke.sh` runs the existing unprivileged tests
in a temporary copy inside the demo folder and preserves your screenshot state.
See the bundled README for all native sequences and control options.

These examples do not establish real checker wording or container behavior:
the validated demonstration's NOT READY/NOT YET/PASS messages are simulated.
Never use the installed real course `lab` command for these fictional examples.
