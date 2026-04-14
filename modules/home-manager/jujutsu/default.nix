{ config, pkgs, self, ... }: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Martin Svanberg";
        email = "martin@martinsvanberg.com";
      };
      signing = {
        behavior = "own";
        backend = "ssh";
        key = "~/.ssh/id_ed25519";
      };
      ui = {
        default-command = "log";
        editor = "nvim";
        diff.tool = "difftastic";
      };
    };
  };
}
