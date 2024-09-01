#!/bin/bash -e
# -*- compile-command: "./register-new-user.sh"; -*-
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

go run ${REPO_DIR}/cmd/register-new-user/main.go "$@"

# For Demo:
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-1" -password "${GOLEM_2024_HACKATHON_USER1_PASSWORD}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-2" -password "${GOLEM_2024_HACKATHON_USER2_PASSWORD}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-3" -password "${GOLEM_2024_HACKATHON_USER3_PASSWORD}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-4" -password "${GOLEM_2024_HACKATHON_USER4_PASSWORD}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-5" -password "${GOLEM_2024_HACKATHON_USER5_PASSWORD}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-6" -password "${GOLEM_2024_HACKATHON_USER6_PASSWORD}"
# go run ${REPO_DIR}/cmd/register-new-user/main.go -debug -handle "user-7" -password "${GOLEM_2024_HACKATHON_USER7_PASSWORD}"

# For Demo: manually create each new user worker since I couldn't figure out how to do that from the MoonBit wasm plugin.
# ./golem-add-user-worker.sh "user-1"
# ./golem-add-user-worker.sh "user-2"
# ./golem-add-user-worker.sh "user-3"
# ./golem-add-user-worker.sh "user-4"
# ./golem-add-user-worker.sh "user-5"
# ./golem-add-user-worker.sh "user-6"
# ./golem-add-user-worker.sh "user-7"
