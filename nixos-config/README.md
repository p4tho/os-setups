# nixos-config
This is everything required to recreate my development system. It uses unstable Nix packages to keep up with the latest tech and custom tooling to make development setup easier.

## prerequisites
- NixOS
- home-manager

## installation
**clone repository**
```
git clone https://github.com/p4tho/nixos-config ~/
cd nixos-config
```
**make dev tools executable**
```
chmod ./install-dev-tools.sh
./install-dev-tools.sh
```
**add hardware config**
```
sudo nixos-generate-config --dir system
```

**change system**
```
sudo nixos-rebuild switch --flake . --impure
```

## custom dev tools
|    command    |  description  |     usage     |
| ------------- | ------------- | ------------- |
|  nix-pyshell  | create shell.nix for python development | nix-pyshell |
