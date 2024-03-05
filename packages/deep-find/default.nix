{ pkgs, fzf, fd, ... }: pkgs.writeShellApplication {
  name = "deep-find";
  runtimeInputs = [ fzf fd ];
  text = builtins.readFile ./script.sh;
}
