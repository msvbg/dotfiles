{ nixpkgs-unstable, fenix, ... }: {
  vscode-unstable = import ./vscode-unstable.nix { inherit nixpkgs-unstable; };
  fenix = fenix.overlays.default;
}
