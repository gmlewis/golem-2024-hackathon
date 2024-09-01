#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)

cd ${REPO_DIR}
go test ./...
pushd components/user
moon fmt
moon test -v --target wasm
cd ../user-manager
moon fmt
moon test -v --target wasm
popd
