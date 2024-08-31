#!/bin/bash -e
moon build --target wasm
wasm-tools component embed \
    wit \
    ../../target/wasm/release/build/components/user-manager/user-manager.wasm \
    -o user-manager.wasm \
    --encoding utf16
wasm-tools component new user-manager.wasm -o user-manager.wasm
