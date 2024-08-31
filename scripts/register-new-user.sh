#!/bin/bash -e
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_DIR=$(realpath ${SCRIPT_DIR}/..)
source ${REPO_DIR}/.env.development.local

go run cmd/register-new-user/main.go "$@"

# FOR DEMO:
# go run cmd/register-new-user/main.go -debug -handle "user-1" -password "${GOLEM_2024_HACKATHON_USER1_PASSWORD}"
# go run cmd/register-new-user/main.go -debug -handle "user-2" -password "${GOLEM_2024_HACKATHON_USER2_PASSWORD}"
# go run cmd/register-new-user/main.go -debug -handle "user-3" -password "${GOLEM_2024_HACKATHON_USER3_PASSWORD}"
# go run cmd/register-new-user/main.go -debug -handle "user-4" -password "${GOLEM_2024_HACKATHON_USER4_PASSWORD}"
# go run cmd/register-new-user/main.go -debug -handle "user-5" -password "${GOLEM_2024_HACKATHON_USER5_PASSWORD}"
