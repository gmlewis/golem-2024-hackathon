#!/bin/bash -e
# -*- compile-command: "./forwarded-list-user-tweets.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{list-user-tweets}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER1_XID}'"' \
    --arg '""' \
    --arg '100'

#     "golem:component/api.{list-user-tweets}(user-xid: string, before: string, limit: u32) -> variant { error(string), success(record { tweets: list<record { user-xid: string, tweet-contents: string, tweet-xid: string }> }) }"
