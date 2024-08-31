#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)

cd ${REPO_DIR}
go test ./...
moon fmt
moon test -v
