{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # dev tools
    git
    python3
    jdk
    zig
    foundry
    protobuf
    protoc-gen-go
    protoc-gen-rust
    protoc-gen-go-grpc
    protoc-gen-rust-grpc
    vim
    ripgrep

    go
    gopls

    rustup

    gcc
    gnumake

    nodejs
    pnpm
    bun

    # network
    net-tools
    inetutils
    curl
    httpie

    # school
    brave

    # etc.
    wget
    ffmpeg
    file
    strace
    ltrace
    htop
    tree
    fastfetch
    zip
    unzip
    lsof

    # custom tools
    (writeShellScriptBin "nix-pyshell" (
      builtins.readFile ./dev-tools/nix-pyshell/script.sh
    ))
  ];
}
