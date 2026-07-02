#!/usr/bin/env bash
set -euo pipefail

echo "Installing apps..."
sudo pacman -S --needed --noconfirm \
  htop \
  kitty \
  thunar \
  thunar-volman \
  vim \
  wget \
  zed \

yay -S --needed --noconfirm \
  brave-bin \
  librewolf-bin
