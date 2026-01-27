cargo install --locked --root %PREFIX% --no-track --path crates/pixi
cargo-bundle-licenses --format yaml --output "%SRC_DIR%/THIRDPARTY.yml"