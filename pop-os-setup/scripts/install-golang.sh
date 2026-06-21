#!/usr/bin/env bash
set -euo pipefail

if command -v go >/dev/null 2>&1; then
    echo "Go is already installed."
    exit 0
fi

echo "Fetching latest Go version..."
GO_VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)

echo "Downloading $GO_VERSION..."
curl -LO "https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz"

echo "Installing Go..."
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "${GO_VERSION}.linux-amd64.tar.gz"

rm "${GO_VERSION}.linux-amd64.tar.gz"

if ! grep -q "/usr/local/go/bin" "$HOME/.bashrc"; then
    echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> "$HOME/.bashrc"
fi

export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
