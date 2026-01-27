#!/usr/bin/env bash

#export OPENSSL_DIR = "$PREFIX"
if [ $( uname -s ) == "Linux" ]; then
  # This flag is needed for tree-sitter on linux
  export CFLAGS = "$CFLAGS -D_BSD_SOURCE"
fi
cargo install --locked --root $PREFIX --no-track --path crates/pixi
cargo-bundle-licenses --format yaml --output "$SRC_DIR/THIRDPARTY.yml"
