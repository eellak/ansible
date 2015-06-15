#!/usr/bin/env bash
#
# Script to automatically create a wildcard SSL key pair for EELLAK.
# To be used each year when upgrading the SSL certificate.
# It will create a directory with the current date and in it
# the CSR will be populated with the appropriate information.
#
# To check the information is correct you can do:
#    openssl req -noout -text -in ellak.gr.csr
#
# Copy the contents of `ellak.gr.csr` and upload to the SSL provider.
#

DATE=ellakssl-$(date +%F-%H%M)

mkdir $DATE
pushd $DATE
openssl req -nodes -sha256 -newkey rsa:2048 -keyout "ellak.gr.key" -out "ellak.gr.csr" -subj "/C=GR/ST=Attica/L=Athens/O=EELLAK/OU=IT dept./CN=*.ellak.gr"
popd
