#!/bin/bash -e
# -*- compile-command: "./register-new-user.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

# go run ${REPO_DIR}/cmd/register-new-user/main.go "$@"

# For Demo:
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-1" -password "${GOLEM_2024_HACKATHON_USER1_PASSWORD}" -xid "${GOLEM_2024_HACKATHON_USER1_XID}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-2" -password "${GOLEM_2024_HACKATHON_USER2_PASSWORD}" -xid "${GOLEM_2024_HACKATHON_USER2_XID}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-3" -password "${GOLEM_2024_HACKATHON_USER3_PASSWORD}" -xid "${GOLEM_2024_HACKATHON_USER3_XID}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-4" -password "${GOLEM_2024_HACKATHON_USER4_PASSWORD}" -xid "${GOLEM_2024_HACKATHON_USER4_XID}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-5" -password "${GOLEM_2024_HACKATHON_USER5_PASSWORD}" -xid "${GOLEM_2024_HACKATHON_USER5_XID}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-6" -password "${GOLEM_2024_HACKATHON_USER6_PASSWORD}" -xid "${GOLEM_2024_HACKATHON_USER6_XID}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-7" -password "${GOLEM_2024_HACKATHON_USER7_PASSWORD}" -xid "${GOLEM_2024_HACKATHON_USER7_XID}"

# For Demo: manually create each new user worker since I couldn't figure out how to do that from the MoonBit wasm plugin.
# ./golem-delete-user-worker.sh "user-1"
# ./golem-delete-user-worker.sh "user-2"
# ./golem-delete-user-worker.sh "user-3"
# ./golem-delete-user-worker.sh "user-4"
# ./golem-delete-user-worker.sh "user-5"
# ./golem-delete-user-worker.sh "user-6"
# ./golem-delete-user-worker.sh "user-7"

./golem-add-user-worker.sh "user-1"
./golem-add-user-worker.sh "user-2"
./golem-add-user-worker.sh "user-3"
./golem-add-user-worker.sh "user-4"
./golem-add-user-worker.sh "user-5"
./golem-add-user-worker.sh "user-6"
./golem-add-user-worker.sh "user-7"

# For Demo:
golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{follow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER2_XID}'"' \
    --arg '"worker-to-worker-rpc-not-implemented-yet"'
golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{follow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER3_XID}'"' \
    --arg '"worker-to-worker-rpc-not-implemented-yet"'
golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{follow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER4_XID}'"' \
    --arg '"worker-to-worker-rpc-not-implemented-yet"'
golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{follow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER5_XID}'"' \
    --arg '"worker-to-worker-rpc-not-implemented-yet"'
golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{follow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER6_XID}'"' \
    --arg '"worker-to-worker-rpc-not-implemented-yet"'
golem-cli worker invoke-and-await \
    -p ${GOLEM_2024_HACKATHON_PROJECT_NAME} \
    --component-name "user" \
    --worker-name "user-1" \
    --function "golem:component/api.{follow-user}" \
    --arg '"'${GOLEM_2024_HACKATHON_USER7_XID}'"' \
    --arg '"worker-to-worker-rpc-not-implemented-yet"'
