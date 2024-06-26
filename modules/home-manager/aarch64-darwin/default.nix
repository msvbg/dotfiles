{ config, pkgs, lib, ... }: {
  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "vscode"
    ];
  };

  home.packages = with pkgs; [
    coreutils
    lld # Useful for fast Rust linking on macOS
  ];

  home.sessionVariables = { };
}
