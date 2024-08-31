#!/bin/bash -e
wit-bindgen moonbit wit --derive-show --derive-eq --out-dir .
mv interface/exports/golem/component/api/*.mbt .
mv stub.mbt user-manager.mbt

cat <EOF >> user-manager.mbt
/// The `user-manager` component handles all user authentication, profiles, and info.
/// Each user is created with a globally-unique XID such that in the future, it will
/// be possible to change a user's public "@handle" easily (if the new handle is available)
/// without the need for anything else changing in the backend.
EOF

mv gen/* .
sed -i '' -e 's|@api\.||g' interface_exports_golem_component_api_export.mbt
sed -i '' -e 's|import.*$|import": ["gmlewis/golem-2024-hackathon/components/user-manager/ffi"]|' moon.pkg.json
rm -rf gen worlds interface moon.mod.json
moon fmt
