{ home-manager, nixpkgs, nixpkgs-unstable, nix-index-database, system, self, ... }@inputs:
let
  names = builtins.attrNames (builtins.readDir ./.);
  mkHome = name: home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        self.overlays.vscode-unstable
        self.overlays.claude-code
        self.overlays.codex
        self.overlays.fenix
      ];
    };
    modules = [
      ./${name}/home.nix
      nix-index-database.hmModules.nix-index
      self.homeModules.home
      self.homeModules.${system}
    ];
    extraSpecialArgs = inputs;
  };
in
nixpkgs.lib.genAttrs names mkHome
