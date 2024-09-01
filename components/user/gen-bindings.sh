#!/bin/bash -e
wit-bindgen moonbit wit --derive-show --derive-eq --out-dir .
moon fmt
