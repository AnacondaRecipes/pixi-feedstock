#!/usr/bin/env bash

#export OPENSSL_DIR = "$PREFIX"
#if $nu.os-info.name == "linux" {
#  # This flag is needed for tree-sitter on linux
#  $env.CFLAGS = $"($env.CFLAGS) -D_BSD_SOURCE"
#}
cargo install --locked --root $PREFIX --no-track --path crates/pixi
cargo-bundle-licenses --format yaml --output "$SRC_DIR/THIRDPARTY.yml"
