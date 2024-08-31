#!/bin/bash -e
wit-bindgen moonbit wit --derive-show --derive-eq --out-dir .
mv interface/exports/golem/component/api/*.mbt .
cat stub.mbt >> user-manager.mbt
rm stub.mbt
mv gen/* .
sed -i '' -e 's|@api\.||g' interface_exports_golem_component_api_export.mbt
sed -i '' -e 's|import.*$|import": ["gmlewis/golem-2024-hackathon/components/user-manager/ffi"]|' moon.pkg.json
rm -rf gen worlds interface moon.mod.json
moon fmt
