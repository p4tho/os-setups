#!/usr/bin/env bash

SCRIPTS_DIR="./scripts"

# Update package list and install curl
echo "Updating package list..."
sudo apt-get update -y >/dev/null 2>&1

# Install dependencies
echo "Installing build-essential..."
sudo apt-get install -y build-essential curl git tar >/dev/null 2>&1

# Check if directory exists
if [ ! -d "$SCRIPTS_DIR" ]; then
  echo "Directory $SCRIPTS_DIR does not exist."
  exit 1
fi

echo "----------------------"

# Iterate through scripts
for script in "$SCRIPTS_DIR"/*; do
  [ -e "$script" ] || continue

  if [ -f "$script" ]; then
    echo "Running: $script"

    chmod +x "$script" >/dev/null 2>&1
    "$script"

    if [ $? -ne 0 ]; then
      echo "Script failed: $script"
    fi

    echo "Finished: $script"
    echo "----------------------"
  fi
done