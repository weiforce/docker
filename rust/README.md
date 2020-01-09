# 在ubuntu下使用国内源安装
export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
curl https://sh.rustup.rs -sSf | sh
# 速度如果慢 可以下载文件到本地再替换
curl -o rust-init.sh https://sh.rustup.rs
# RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"



# Change mirror

使用 rustup 安装 rust 时，若要启用 TUNA 源，执行：

# for bash
sudo RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install stable # for stable
# for fish
sudo env RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install stable # for stable
# for bash
sudo RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install nightly # for nightly
# for fish
sudo env RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install nightly # for nightly
# for bash
RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install nightly-2019-02-15 # for nightly since 2019.02.15
# for fish
env RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install nightly-2019-02-15 # for nightly since 2019.02.15
若要长期启用 TUNA 源，执行：

$ # for bash
$ echo 'export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup' >> ~/.bash_profile
$ # for fish
$ echo 'set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup' >> ~/.config/fish/config.fish

# Rust up failed

    remove rust shell mirror value,do not use tuna.tsinghua.edu.cn

# Add Proxy /home/core/data/rust/cargo/config

[http]
proxy = "192.168.56.101:1080"

[https]
proxy = "192.168.56.101:1080"

[http]
proxy = "socks5://192.168.56.101:1080"

[https]
proxy = "socks5://192.168.56.101:1080"

# windows 安装 rust

* rust-init.exe https://win.rustup.rs/x86_64
* Visual C++ Build Tools 2015 https://go.microsoft.com/fwlink/?LinkId=691126
