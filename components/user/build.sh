#!/bin/bash -e
moon build --target wasm
wasm-tools component embed \
    wit \
    ../../target/wasm/release/build/components/user/user.wasm \
    -o user.wasm \
    --encoding utf16
wasm-tools component new user.wasm -o user.wasm
cp user.wasm ~/Downloads/
