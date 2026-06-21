#!/usr/bin/env bash
set -e

# Detect shell rc file (bash default on Pop!_OS)
SHELL_RC="${HOME}/.bashrc"

# Install Zed if missing
if command -v zed >/dev/null 2>&1; then
  echo "Zed already installed."
  exit 0
else
  echo "Installing Zed..."
  (curl -f https://zed.dev/install.sh | sh) >/dev/null 2>&1
fi

# Ensure ~/.local/bin is in PATH
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
else
  echo "~/.local/bin already in PATH"
fi