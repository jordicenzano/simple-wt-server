#!/usr/bin/env bash

# Get base 64 of scert cmd RSA
# certbase64=$(eval "openssl x509 -pubkey -noout -in ../certs/certificate.pem | openssl rsa -pubin -outform der | openssl dgst -sha256 -binary | base64")

# Get base 64 of scert cmd ECDSA
certbase64=$(eval "openssl x509 -pubkey -noout -in ../certs/certificate.pem | openssl ec -pubin -outform der | openssl dgst -sha256 -binary | base64")

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir="/tmp/chrome_dev_session" --enable-features=SharedArrayBuffer --origin-to-force-quic-on=localhost:4433  --allow-insecure-localhost --ignore-certificate-errors-spki-list=$certbase64