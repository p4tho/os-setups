#!/usr/bin/env bash
set -euo pipefail

if command -v rustup >/dev/null 2>&1; then
    echo "rustup already installed."
    exit 0
else
    echo "Installing rustup..."
    (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y) >/dev/null 2>&1
fi

echo "Loading Cargo environment..."
source "$HOME/.cargo/env" >/dev/null 2>&1

echo "Setting stable toolchain as default..."
rustup default stable >/dev/null 2>&1
