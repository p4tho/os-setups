{

  description = "kiichi's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:

  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = system;
        modules = [
          # system
          ./system/configuration.nix
          ./system/modules/system-packages/default.nix
          ./system/modules/users/default.nix

          # home-manager
          home-manager.nixosModules.home-manager

          ./system/modules/home-manager/default.nix
        ];
      };
    };
  };

}
