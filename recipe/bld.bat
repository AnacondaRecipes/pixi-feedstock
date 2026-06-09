set CARGO_NET_GIT_FETCH_WITH_CLI=true
set CARGO_PROFILE_RELEASE_STRIP=symbols
subst Y: "%SRC_DIR%"
set CARGO_HOME=Y:\.cargo

rem Anaconda default channels (compile-time via option_env! in pixi_consts)
rem https://github.com/prefix-dev/pixi/blob/v0.70.2/crates/pixi_consts/src/consts.rs#L97-L111
set PIXI_DEFAULT_CHANNELS=https://repo.anaconda.com/pkgs/main,https://repo.anaconda.com/pkgs/msys2

cargo install --locked --root %PREFIX% --no-track --path crates/pixi
cargo-bundle-licenses --format yaml --output "%SRC_DIR%/THIRDPARTY.yml"

subst Y: /d
