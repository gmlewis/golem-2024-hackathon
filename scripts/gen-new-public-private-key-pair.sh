#!/bin/bash -e
# From: https://stackoverflow.com/questions/5244129/use-rsa-private-key-to-generate-public-key
openssl genrsa -out key.pem 4096
openssl rsa -in key.pem -pubout -out key.pem.pub
