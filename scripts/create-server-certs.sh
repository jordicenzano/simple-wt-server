#!/usr/bin/env bash

# Create certs dir if it does not exists
rm ../certs/certificate.*
mkdir -p ../certs

# Generate ECDSA public - private key 
openssl req -new -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -x509 -nodes -days 10 -out ../certs/certificate.pem -keyout ../certs/certificate.key -subj '/CN=Test Certificate' -addext "subjectAltName = DNS:localhost"

openssl x509 -in ../certs/certificate.pem | openssl dgst -sha256 -binary | openssl enc -base64 > ../certs/certificate.hash