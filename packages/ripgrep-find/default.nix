{ pkgs, fzf, ripgrep, ... }: pkgs.writeShellApplication {
  name = "ripgrep-find";
  runtimeInputs = [ fzf ripgrep ];
  text = builtins.readFile ./script.sh;
}
