{ config, pkgs, lib, self, ... }: {
  imports = with self.homeModules; [
    gh
    git
    jujutsu
    vscode
    wezterm
    zsh
  ];

  home.username = "martin";
  home.homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/martin" else "/home/martin";
  home.sessionPath = [ "$HOME/.local/bin" "$HOME/.fly/bin" ];
  home.sessionVariables = {
    STEAMCMD = "$HOME/SteamworksSDK/sdk/tools/ContentBuilder/builder_osx/steamcmd";
  };
  programs.git.settings.user.name = "Martin Svanberg";
  programs.git.settings.user.email = "martin@martinsvanberg.com";
}
