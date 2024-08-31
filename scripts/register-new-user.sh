#!/bin/bash -e
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source .env.development.local

go run cmd/register-new-user/main.go "$@"
