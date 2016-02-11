#!/bin/bash

hostname="$1"
koko="$(openssl rand -rand /dev/urandom -base64 48)"
#file="$(mktemp --tmpdir $hostname.XXXXXX)"
file=/tmp/"$hostname"

cat >$file <<EOF
  %echo Generating a basic OpenPGP key
  Key-Type: RSA
  Key-Length: 4096
 #Subkey-Type: ELG-E
 #Subkey-Length: 1024
  Name-Real: $hostname backup
 #Name-Comment: with stupid passphrase
 #Name-Email: joe@foo.bar
 #Expire-Date: 0
  Passphrase: $koko
 #%pubring foo.pub
 #%secring foo.sec
  # Do a commit here, so that we can later print "done" :-)
  %commit
  %echo done
EOF
gpg --batch --gen-key "$file"
