#!/usr/bin/env sh
set -e

function randstr() {
  len=${1:?no length}
  LC_ALL=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c $len
}

mkdir -p tinyauth/config/oidc/
cd tinyauth/config/oidc/

openssl genrsa -traditional -out key.pem 2048
openssl rsa -in key.pem -pubout -out key.pub

randstr 32 > immich
