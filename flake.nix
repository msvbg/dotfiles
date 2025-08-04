{
  description = "Martin's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-darwin = { url = "github:LnL7/nix-darwin"; inputs.nixpkgs.follows = "nixpkgs"; };
    nix-index-database = { url = "github:Mic92/nix-index-database"; inputs.nixpkgs.follows = "nixpkgs"; };
    home-manager = { url = "github:nix-community/home-manager/release-25.05"; inputs.nixpkgs.follows = "nixpkgs"; };

    fenix = { url = "github:nix-community/fenix/f53ddf7518d85d59b58df6e9955b25b0ac25f569"; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    let
      mkSystem = system: {
        legacyPackages.homeConfigurations = import ./homes (inputs // { inherit system; });
        packages = import ./packages (inputs // { inherit system; });
        devShells.default = let pkgs = nixpkgs.legacyPackages.${system}; in pkgs.mkShell {
          buildInputs = [ pkgs.home-manager ];
        };
        homeConfigurations = import ./homes (inputs // { inherit system; });
      };
    in
    flake-utils.lib.eachDefaultSystem mkSystem // {
      darwinConfigurations = import ./hosts inputs;
      darwinModules = import ./modules/nix-darwin inputs;
      homeModules = import ./modules/home-manager inputs;
      overlays = import ./overlays inputs;
    };
}
