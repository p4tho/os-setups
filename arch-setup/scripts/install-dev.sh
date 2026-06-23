#!/usr/bin/env bash
set -euo pipefail

echo "Installing base development tools (C/C++ toolchain)..."

sudo pacman -S --needed --noconfirm \
  base-devel \
  gcc \
  clang \
  lldb \
  gdb \
  make \
  cmake \
  ninja \
  pkgconf

echo "Installing Go..."
sudo pacman -S --needed --noconfirm go

echo "Installing Rust (rustup)..."

if ! command -v rustup >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm rustup
fi

# IMPORTANT: rustup must run as USER, not root
if ! command -v rustc >/dev/null 2>&1; then
  rustup default stable
fi