#!/bin/sh

export CARGO_INCREMENTAL=0
export RUSTFLAGS="-Zprofile -Ccodegen-units=1 -Copt-level=0 -Clink-dead-code -Coverflow-checks=off -Zpanic_abort_tests -Cpanic=abort"
export RUSTDOCFLAGS="-Cpanic=abort"

cargo clean
cargo build
cargo test

grcov ./target/debug/ -s . -t html --llvm --branch --ignore-not-existing --ignore tests/ -o ./target/debug/coverage/
