{ nixpkgs, ... }:

final: prev:
let
  pkgs = import nixpkgs {
    system = prev.system;
    config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
      "claude-code"
    ];
  };
in
{
  claude-code = pkgs.claude-code;
}
