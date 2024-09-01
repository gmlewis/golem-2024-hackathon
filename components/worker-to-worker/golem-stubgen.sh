#!/bin/bash -e
rm -rf user user-stub
mkdir user
rsync -arv ../user/wit/ ./user/wit/
golem-cli stubgen generate \
    --source-wit-root user/wit \
    --dest-crate-root user-stub \
    "$@"
