#!/bin/bash -e
rm -rf target
moon build --target wasm-gc
wasm-tools component embed \
    wit \
    target/wasm-gc/release/build/gen/gen.wasm \
    -o user-manager-gc.wasm \
    --encoding utf16
wasm-tools component new user-manager-gc.wasm -o user-manager-gc.wasm
cp user-manager-gc.wasm ~/Downloads/
