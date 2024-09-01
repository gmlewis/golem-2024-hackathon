#!/bin/bash -e
rm -rf target
moon build --target wasm
wasm-tools component embed \
    wit \
    target/wasm/release/build/component.wasm \
    -o user-manager.wasm \
    --encoding utf16
wasm-tools component new user-manager.wasm -o user-manager.wasm
cp user-manager.wasm ~/Downloads/
