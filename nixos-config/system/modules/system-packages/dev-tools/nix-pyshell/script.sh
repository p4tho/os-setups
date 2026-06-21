#!/usr/bin/env bash

set -e

# Get the directory where this script lives
FLAKE_NIX_PATH="$HOME/nixos-config/system/modules/system-packages/dev-tools/nix-pyshell/flake.nix"

# Copy the template into the current working directory
cp $FLAKE_NIX_PATH .