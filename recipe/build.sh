#!/usr/bin/env bash

export OPENSSL_DIR="$PREFIX"

if [ $( uname -s ) == "Linux" ]; then
  # This flag is needed for tree-sitter on linux
  export CFLAGS="${CFLAGS} -D_BSD_SOURCE"
fi

# Anaconda default channels (compile-time via option_env! in pixi_consts)
export PIXI_DEFAULT_CHANNELS="https://repo.anaconda.com/pkgs/main"

export CARGO_PROFILE_RELEASE_STRIP=symbols
cargo auditable install --locked --no-default-features --features native-tls --root $PREFIX --no-track --path crates/pixi --bin pixi
cargo-bundle-licenses --format yaml --output "$SRC_DIR/THIRDPARTY.yml"

# Generate shell completions for unix shells
pixi="$PREFIX/bin/pixi"
mkdir -p "$PREFIX/share/bash-completion/completions"
mkdir -p "$PREFIX/share/zsh/site-functions"
mkdir -p "$PREFIX/share/fish/vendor_completions.d"
"$pixi" completion --shell bash > "$PREFIX/share/bash-completion/completions/pixi"
"$pixi" completion --shell zsh > "$PREFIX/share/zsh/site-functions/_pixi"
"$pixi" completion --shell fish > "$PREFIX/share/fish/vendor_completions.d/pixi.fish"
