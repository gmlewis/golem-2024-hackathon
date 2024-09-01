#!/bin/bash -e
# -*- compile-command: "./forwarded-unfollow-user.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{unfollow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER7_XID}'"'

#     "golem:component/api.{unfollow-user}(other-user-xid: string) -> variant { error(string), success(string) }",
