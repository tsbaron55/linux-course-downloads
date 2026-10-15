# CIS255 native VM bundle HTTPS test 1

Temporary developer-only public HTTPS test. Not classroom-approved. Do not overwrite the previously staged, pinned M2 activity candidate.

The archive cis255-native-labs-0.1.0-test1.tar.gz combines the exact student-only M2 Hidden Ticket and Maintenance Report candidate archives from private source commit 1c5eeca56da930971501eba91a49ae4512f35cc2. It does not contain instructor notes/solutions or development history.

Archive size: 3,879 bytes
Archive SHA-256: 52c1212202346148ebe882e201053fb6ac7f5ef99e66c960af878df3f014d186
Setup script SHA-256: 186093eea58ac75a44ee9f66f55af0af24b5d64517adc17ac8bfaae3185c37df

From a disposable, clean ordinary-user Rocky Linux account with no ~/cis255 directory:

    curl -fL -o setup-vm-labs.sh https://raw.githubusercontent.com/tsbaron55/linux-course-downloads/main/development/native-labs-setup-test1/setup-vm-labs.sh
    echo '186093eea58ac75a44ee9f66f55af0af24b5d64517adc17ac8bfaae3185c37df  setup-vm-labs.sh' | sha256sum -c -
    bash setup-vm-labs.sh
    ls -la ~/cis255/m2-tryit ~/cis255/m2-proveit

The script downloads the archive using public raw GitHub HTTPS, validates its exact digest, and extracts both student activities without sudo. The wrapper does not start activities or run root commands. Test again with ~/cis255 existing: it must refuse without overwriting anything.

Local mock-curl tests passed for success, existing-directory protection, and corrupt archive refusal. Live HTTPS from actual Rocky is pending; the author's container cannot resolve raw.githubusercontent.com.

The approved Schoolcraft production URLs and hash will replace this development staging when accepted. None of these temporary artifacts is a final M2 release.
