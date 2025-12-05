{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
	
	home-manager = {
		url = "github:nix-community/home-manager/";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	
  };

  outputs = inputs@{ nixpkgs, home-manager, chaotic, ...} : {
		nixosConfigurations =  {
			nixpkgs.config.allowUnfree = true;
			ten-of-swords = nixpkgs.lib.nixosSystem {
				modules = [
					./configuration.nix
					chaotic.nixosModules.default
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
