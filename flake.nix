{
	inputs = {
		# Nixpkgs
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		# Home manager
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		neovim-flake.url = "github:notashelf/neovim-flake";
		neovim-flake.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = {
		self,
		nixpkgs,
		home-manager,
		...
	} @ inputs: let
		forAllSystems = nixpkgs.lib.genAttrs [
			"x86_64-linux"
		];
	in {
		nixosConfigurations = {
			pythagoras = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = {inherit inputs;};
				modules = [
					home-manager.nixosModules.home-manager
					./configuration.nix
					#./hardware-configuration.nix
					./homes
				];
			};
		};
	};
}
