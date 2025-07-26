{
	description = "Flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.05";
		home-manager.url = "github:nix-community/home-manager/release-25.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		xremap-flake.url = "github:xremap/nix-flake";
		nvf.url = "github:notashelf/nvf";
	};

	outputs = { nixpkgs, home-manager, xremap-flake, nvf, ... }:
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			nixosConfigurations = {
				nixos = lib.nixosSystem {
					inherit system;
					modules = [
					./configuration.nix
					];
				};
			};
			homeConfigurations = {
				jan = home-manager.lib.homeManagerConfiguration {
                                        inherit pkgs;
                                        modules = [
                                                ./home.nix
                                                xremap-flake.homeManagerModules.default
                                                nvf.homeManagerModules.default
                                                        programs.neovim = {
                                                                enable = true;
                                                                package = nvf.packages.${system}.default;
                                                        };
					];
				};
			};
		};
}
