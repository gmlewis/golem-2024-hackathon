#!/bin/bash -e
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

# go run ${REPO_DIR}/cmd/get-user-info/main.go "$@"

# FOR DEMO:
go run ${REPO_DIR}/cmd/get-user-info/main.go -debug -user "user-1" -xid "${GOLEM_2024_HACKATHON_USER1_XID}" -handle "user-2"
