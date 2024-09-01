#!/bin/bash -e
golem-cli stubgen generate \
    --source-wit-root user/wit \
    --dest-crate-root user-stub \
    "$@"
