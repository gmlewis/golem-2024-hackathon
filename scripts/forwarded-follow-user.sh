#!/bin/bash -e
# -*- compile-command: "./forwarded-follow-user.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{follow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER2_XID}'"' \
    --arg '"worker-to-worker-rpc-not-implemented-yet"'

#     "golem:component/api.{follow-user}(other-user-xid: string, other-user-worker: string) -> variant { error(string), success(string) }",
