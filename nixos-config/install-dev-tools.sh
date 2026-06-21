#!/usr/bin/env bash

# Change permissions of bash scripts
for dir in ./system/modules/system-packages/dev-tools/*; do
  if [ -d "$dir" ]; then
    dir="${dir%/}"
    script="$dir/script.sh"
    if [ -f "$script" ]; then
      echo "Changing mode for $script..."
      chmod +x "$script"
    else
      echo "No script.sh found in $dir"
    fi
  fi
done