#!/usr/bin/env bash
set -euo pipefail

echo "Installing necessary shit..."

sudo pacman -S --needed --noconfirm \
  dmenu \
  gvfs \
  gst-plugin-pipewire \
  intel-media-driver \
  iwd \
  libpulse \
  libva-intel-driver \
  pipewire \
  pipewire-alsa \
  pipewire-jack \
  pipewire-pulse \
  pkgconf \
  polkit-gnome \
  smartmontools \
  sof-firmware \
  sudo \
  udiskie \
  udisks2 \
  ufw \
  vulkan-intel \
  vulkan-nouveau \
  vulkan-radeon \
  wireplumber \
  xdg-utils \
  xf86-video-amdgpu \
  xf86-video-ati \
  xf86-video-nouveau \
  xorg-xinit \
  xss-lock

echo "Installing Desktop Environment (i3wm)..."

sudo pacman -S --needed --noconfirm \
  brightnessctl \
  i3-wm \
  i3status \
  lightdm \
  lightdm-gtk-greeter \
  rofi