{ ... }: {
  programs.zsh = {
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
      # Replace zsh's default completion selection menu with fzf
      zinit light Aloxaf/fzf-tab

      # vi keybindings
      zinit light jeffreytse/zsh-vi-mode

      # Preview directory's content with eza when completing cd
      zstyle ':completion:*:git-checkout:*' sort false
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

      # Aliases for going up multiple directories
      alias -g ...='../..'
      alias -g ....='../../..'
      alias -g .....='../../../..'
      alias -g ......='../../../../..'
    '';
  };
}
