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
    f = "${self.packages.${pkgs.system}.deep-find}/bin/deep-find";
    frg = "${self.packages.${pkgs.system}.ripgrep-find}/bin/ripgrep-find";
    g = "git";
    gcm = "git checkout main 2>/dev/null || git checkout master";
    gco = "EDITOR=nvim git commit --patch";
    gd = "git diff";
    gdc = "git diff --cached";
    gone = "git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == \"[gone]\" {print $1}' | xargs -r git branch -D";
    gp = "git push";
    gpf = "git push --force-with-lease";
    gpu = "git pull";
    gr = "git rebase --interactive";
    grestore = "git restore --patch --source";
    gst = "git status";
    l = "eza -la";
    ls = "eza";
    run = "nix run";
    switch-home = "home-manager switch --flake ~/.config/nix";
    update = "nix flake update --commit-lock-file";
  };

  home.packages = with pkgs; [
    bat
    curl
    eza
    fd
    iterm2
    jq
    just
    mcfly
    rustup
  ];

  programs = {
    bash.enable = true;
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    gpg.enable = true;
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
      gitCredentialHelper.enable = false;
    };
    home-manager.enable = true;
    man.enable = true;
    neovim.enable = true;
    ripgrep.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = false;
      syntaxHighlighting.enable = true;
      history.size = 10000;
      initExtraBeforeCompInit = ''
        if [[ ! -f "$HOME/.zinit/bin/zi.zsh" ]]; then
            print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
            command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
            command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
                print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
                print -P "%F{160}▓▒░ The clone has failed.%f%b"
        fi
        source "$HOME/.zinit/bin/zi.zsh"
      '';

      initExtra = ''
        # Theme
        zinit ice depth=1; zinit light romkatv/powerlevel10k
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        # Replace zsh's default completion selection menu with fzf
        zinit light Aloxaf/fzf-tab

        # vi keybindings
        zinit light jeffreytse/zsh-vi-mode

        # Preview directory's content with eza when completing cd
        zstyle ':completion:*:git-checkout:*' sort false
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
      '';
    };
    wezterm = {
      enable = true;
      extraConfig = ''
        local wezterm = require "wezterm"
        local act = wezterm.action

        local config = {}
        if wezterm.config_builder then
          config = wezterm.config_builder()
        end

        config.keys = {
          {
            key = 'k',
            mods = 'SUPER',
            action = act.Multiple {
              act.ClearScrollback 'ScrollbackAndViewport',
              act.SendKey { key = 'L', mods = 'CTRL' },
            },
          },
        }
        return config
      '';
    };
  };

  # Check for release version mismatch between Home Manager and nixpkgs.
  home.enableNixpkgsReleaseCheck = true;
}
