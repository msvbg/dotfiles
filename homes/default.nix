{ home-manager, nixpkgs, nixpkgs-unstable, nix-index-database, system, self, ... }@inputs:
let
  names = builtins.attrNames (builtins.readDir ./.);
  mkHome = name: home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
          "vscode"
          "vscode-extension-ms-dotnettools-csharp"
          "vscode-extension-ms-dotnettools-csdevkit"
          "vscode-extension-ms-dotnettools-vscode-dotnet-runtime"
          "vscode-extension-supermaven-supermaven"
        ];
      };
      overlays = [
        self.overlays.vscode-unstable
        self.overlays.claude-code
        self.overlays.fenix
      ];
    };
    modules = [
      ./${name}/home.nix
      nix-index-database.homeModules.nix-index
      self.homeModules.home
      self.homeModules.${system}
    ];
    extraSpecialArgs = inputs;
  };
in
nixpkgs.lib.genAttrs names mkHome
