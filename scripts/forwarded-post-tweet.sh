#!/bin/bash -e
# -*- compile-command: "./forwarded-post-tweet.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

export XID=$(go run ${REPO_DIR}/cmd/gen-tweet-xid/main.go)
golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{post-tweet}" \
    --arg '"MoonBit programming is still fun"' \
    --arg '"'${XID}'"'

#     "golem:component/api.{post-tweet}(tweet-contents: string, tweet-xid: string) -> variant { error(string), success(string) }",
