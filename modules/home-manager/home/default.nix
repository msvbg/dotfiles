{ config, pkgs, lib, self, ... }@inputs: {
  home.stateVersion = "23.11";

  # Add each flake input to registry.
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # Set environment variables.
  home.sessionVariables = {
    EDITOR = "code";
  };

  home.shellAliases = {
    build = "nix build";
    develop = "nix develop";
    edit = "nix edit";
    f = "d=$(fd --type directory | fzf); [[ -n \"d\" ]] && cd \"$d\"";
    frg = "${self.packages.${pkgs.system}.ripgrep-find}/bin/ripgrep-find";
    l = "eza -la";
    ls = "eza";
    run = "nix run";
    edit-nix = "code ~/.config/nix";
    switch-home = "home-manager switch --flake ~/.config/nix";
    update = "nix flake update --commit-lock-file";
  };

  home.packages =
    with pkgs; [
      bash
      bat
      curl
      difftastic
      direnv
      eza
      fd
      home-manager
      iterm2
      jq
      just
      man
      mcfly
      neovim
      nil
      nixpkgs-fmt
      pkg-config
      ripgrep
      rustup
      starship
      tokei
      tracy
    ];

  programs = {
    gpg.enable = true;
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    mcfly = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      keyScheme = "vim";
    };
  };

  # Check for release version mismatch between Home Manager and nixpkgs.
  home.enableNixpkgsReleaseCheck = true;
}
