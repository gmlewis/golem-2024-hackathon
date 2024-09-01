#!/bin/bash -e
# -*- compile-command: "./golem-delete-user-manager-worker.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

golem-cli worker delete \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user-manager" \
    --worker-name "user-manager"
