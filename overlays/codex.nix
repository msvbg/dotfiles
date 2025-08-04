{ nixpkgs, self, ... }:

final: prev:
{
  codex-cli = self.packages.${prev.system}.codex-cli;
}
