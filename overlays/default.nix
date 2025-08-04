{ nixpkgs, nixpkgs-unstable, fenix, ... }: {
  vscode-unstable = import ./vscode-unstable.nix { inherit nixpkgs-unstable; };
  claude-code = import ./claude-code.nix { inherit nixpkgs; };
  fenix = fenix.overlays.default;
}
