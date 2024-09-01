#!/bin/bash -e
# -*- compile-command: "./update-profile-picture.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

# go run ${REPO_DIR}/cmd/update-profile-picture/main.go "$@"

# For Demo:
go run ${REPO_DIR}/cmd/update-profile-picture/main.go -user 'user-1' -xid "${GOLEM_2024_HACKATHON_USER1_XID}" -filename ${HOME}/Pictures/gmlewis-github-profile-photo.jpg
