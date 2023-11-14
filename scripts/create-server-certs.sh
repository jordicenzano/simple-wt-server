#!/usr/bin/env bash

# Create certs dir if it does not exists
rm ../certs/certificate.*
mkdir -p ../certs

# Generate ECDSA public - private key 
openssl req -new -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -x509 -nodes -days 10 -out ../certs/certificate.pem -keyout ../certs/certificate.key -subj '/CN=Test Certificate' -addext "subjectAltName = DNS:localhost"

# Generate RSA public - private key 
# openssl req -newkey rsa:2048 -nodes -keyout ../certs/certificate.key -x509 -out ../certs/certificate.pem -subj '/CN=Test Certificate' -addext "subjectAltName = DNS:localhost"
