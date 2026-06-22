#!/usr/bin/env bash
set -euo pipefail

echo "Updating system..."
sudo pacman -Syu --noconfirm

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
  rustup default stable
fi

# Initialize Rust toolchain (stable by default)
if ! command -v rustc >/dev/null 2>&1; then
  echo "Setting up Rust toolchain (stable)..."
  rustup default stable
fi
