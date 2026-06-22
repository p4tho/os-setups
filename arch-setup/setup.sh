#!/usr/bin/env bash

SCRIPTS_DIR="./scripts"

# Check if directory exists
if [ ! -d "$SCRIPTS_DIR" ]; then
  echo "Directory $SCRIPTS_DIR does not exist."
  exit 1
fi

SCRIPTS_DIR="./scripts"

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