{ nixpkgs, nixpkgs-unstable, fenix, self, ... }: {
  vscode-unstable = import ./vscode-unstable.nix { inherit nixpkgs-unstable; };
  claude-code = import ./claude-code.nix { inherit nixpkgs; };
  codex = import ./codex.nix { inherit nixpkgs self; };
  fenix = fenix.overlays.default;
}
