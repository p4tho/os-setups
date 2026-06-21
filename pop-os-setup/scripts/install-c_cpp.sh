#!/usr/bin/env bash
set -e

echo "Installing additional development tools..."
sudo apt install -y \
    gcc \
    g++ \
    gdb \
    make \
    cmake \
    clang \
    lldb

sudo apt autoremove -y
