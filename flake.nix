{
  description = "A very basic flake (with shadps4 overlay)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      # import overlays from ./overlays/*.nix
      overlays = [
        (import ./overlays/shadps4.nix)
      ];
    in {
      # Expose a package so you can `nix build .#shadps4`
      packages.x86_64-linux = let
        pkgs = import nixpkgs { system = "x86_64-linux"; overlays = overlays; };
      in {
        shadps4 = pkgs.shadps4;
      };

      # NixOS systems
      nixosConfigurations = {
        ten-of-swords = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./configuration.nix

            # home-manager module
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.elli = import ./home.nix;
            }

            # attach overlays to the system's pkgs
            ({ ... }: {
              nixpkgs.overlays = overlays;
            })
          ];

          # allow unfree (you had this before)
          nixpkgs.config = { allowUnfree = true; };
        };
      };
    };
}