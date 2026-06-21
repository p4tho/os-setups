# template flake.nix for Python dev environment
{
    description = "python development flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }: let
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in {
        devShells.x86_64-linux.default = pkgs.mkShell {

            packages = with pkgs; [
                (python3.withPackages(p: with p; [
                    # required python packages
                ]))
            ];

            env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
                pkgs.stdenv.cc.cc.lib
                pkgs.libz
            ];

        };
    };
}