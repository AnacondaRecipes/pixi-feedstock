set CARGO_NET_GIT_FETCH_WITH_CLI=true

subst Y: "%SRC_DIR%"
set CARGO_HOME=Y:\.cargo

cargo install --locked --root %PREFIX% --no-track --path crates/pixi
cargo-bundle-licenses --format yaml --output "%SRC_DIR%/THIRDPARTY.yml"

subst Y: /d
