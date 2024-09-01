#!/bin/bash -e
rm -rf target
moon build --target wasm-gc
wasm-tools component embed \
    wit \
    target/wasm-gc/release/build/component.wasm \
    -o user-gc.wasm \
    --encoding utf16
wasm-tools component new user-gc.wasm -o user-gc.wasm
cp user-gc.wasm ~/Downloads/
