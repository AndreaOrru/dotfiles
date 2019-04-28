export EDITOR="vi"
export ALTERNATE_EDITOR=$EDITOR;

export FZF_DEFAULT_OPTS="--exact";

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH="$HOME/.cargo/bin:$PATH"
