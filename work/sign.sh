#!/bin/bash
set -e

sudo apt install -y libnss3-tools
mkdir -p ~/.pki/nssdb
certutil -d ~/.pki/nssdb -N --empty-password
pk12util -d ~/.pki/nssdb -i TomHonour.pfx

#https://askubuntu.com/questions/1225262/how-do-i-generate-a-certificate-to-sign-pdf-electronically
