#!/usr/bin/env bash
set -euo pipefail

echo "Installing necessary shit..."

sudo pacman -S \
  sway \
  swaybg \
  swaylock \
  swayidle \
  waybar \
  wofi \
  foot \
  pipewire \
  pipewire-pulse \
  xdg-desktop-portal-wlr

