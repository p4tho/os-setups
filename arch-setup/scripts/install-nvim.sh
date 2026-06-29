#!/usr/bin/env bash
set -euo pipefail

echo "Installing neovim..."

sudo pacman -S --needed --noconfirm \
  neovim \
  ripgrep \
  xclip
