#!/bin/bash -e
golem-cli stubgen generate \
    --source-wit-root user \
    --dest-crate-root user-stub \
    "$@"
