{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

	home-manager = {
		url = "github:nix-community/home-manager/release-25.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	
  };

  outputs = inputs@{ nixpkgs, home-manager, ...} : {
		nixosConfigurations =  {
			nixpkgs.config.allowUnfree = true;
			ten-of-swords = nixpkgs.lib.nixosSystem {
				modules = [
					./configuration.nix

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;

						home-manager.users.elli = import ./home.nix;
					}
				];
			};
    };  
  };
}
