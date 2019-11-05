# init

    rustup default nightly-2019-07-14
    rustup target add wasm32-unknown-unknown --toolchain nightly-2019-07-14
    cargo install wasm-gc

# install

    cd node/runtime/wasm
    ./build.sh
    cd ../../../
    cargo build --release
