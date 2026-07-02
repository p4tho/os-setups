#!/usr/bin/env bash

set -euo pipefail

SCRIPTS_DIR="./scripts"

if [ ! -d "$SCRIPTS_DIR" ]; then
  echo "Directory $SCRIPTS_DIR does not exist."
  exit 1
fi

if [ -d "./.config" ]; then
  echo "Copying .config to home directory..."

  # safer than overwrite: merges configs
  cp -rT ./.config "$HOME/.config"

  echo ".config copied successfully."
else
  echo "No .config folder found in current directory."
fi

echo "Updating system..."
sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm git base-devel

# Install yay ONLY if not installed
if ! command -v yay >/dev/null 2>&1; then
  echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

# Run scripts as NORMAL USER (not root)
for script in "$SCRIPTS_DIR"/*; do
  [ -e "$script" ] || continue

  if [ -f "$script" ]; then
    echo "Running: $script"

    chmod +x "$script" >/dev/null 2>&1
    "$script"

    echo "Finished: $script"
    echo "----------------------"
  fi
done

echo "----------------------"
