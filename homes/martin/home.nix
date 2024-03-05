{ config, pkgs, lib, self, ... }: {
  imports = with self.homeModules; [
    vscode
  ];

  home.username = "martin";
  home.homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/martin" else "/home/martin";
  programs.git.userName = "Martin Svanberg";
  programs.git.userEmail = "martin@martinsvanberg.com";
}
