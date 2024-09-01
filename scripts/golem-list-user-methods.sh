#!/bin/bash -e
# -*- compile-command: "./golem-list-user-methods.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

golem-cli component get \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user"

# {
#   "componentUrn": "urn:component:c70bde8a-8824-43b5-896d-eb1be94aef6d",
#   "componentVersion": 3,
#   "componentName": "user",
#   "componentSize": 21976,
#   "projectId": "06b43f65-d87b-4589-addf-3b28fff4595c",
#   "exports": [
#     "golem:component/api.{following}() -> variant { error(string), success(record { user-xids: list<string> }) }",
#     "golem:component/api.{follow-user}(other-user-xid: string, other-user-worker: string) -> variant { error(string), success(string) }",
#     "golem:component/api.{unfollow-user}(other-user-xid: string) -> variant { error(string), success(string) }",
#     "golem:component/api.{post-tweet}(tweet-contents: string, tweet-xid: string) -> variant { error(string), success(string) }",
#     "golem:component/api.{get-tweet}(tweet-xid: string) -> variant { error(string), success(string) }",
#     "golem:component/api.{list-all-followed-tweets}(before: string, limit: u32) -> variant { error(string), success(record { tweets: list<record { user-xid: string, tweet-contents: string, tweet-xid: string }> }) }",
#     "golem:component/api.{list-user-tweets}(user-xid: string, before: string, limit: u32) -> variant { error(string), success(record { tweets: list<record { user-xid: string, tweet-contents: string, tweet-xid: string }> }) }"
#   ]
# }
