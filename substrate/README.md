# init

    RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup default nightly
    RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup target add wasm32-unknown-unknown --toolchain nightly
    cargo install wasm-gc

# install

    cd node/runtime/wasm
    ./build.sh
    cd ../../../
    cargo build --release
