{ config, pkgs, self, ... }: {
  programs.git = {
    enable = true;
    signing = {
      signByDefault = true;
      key = "~/.ssh/id_ed25519";
    };
    ignores = [
      ".DS_Store"
      "*~"
      "*.swp"
    ];
    extraConfig = {
      branch.sort = "-committerdate";
      core.editor = "vim";
      core.fsmonitor = true;
      core.untrackedCache = true;
      diff.guitool = "vscode";
      diff.tool = "difftastic";
      difftool.difftastic = { cmd = ''difft "$LOCAL" "$REMOTE"''; };
      difftool.prompt = false;
      difftool.vscode.cmd = "code --wait --diff $LOCAL $REMOTE";
      fetch.writeCommitGraph = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      help.autocorrect = 30;
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      merge.guitool = "vscode";
      merge.tool = "difftastic";
      mergetool.prompt = false;
      mergetool.vscode.cmd = "code --wait $MERGED";
      pager.difftool = true;
      pull.ff = "only";
      push.autoSetupRemote = true;
      rerere.enabled = true;
      user.useConfigOnly = true;
    };
  };
  home.shellAliases = {
    g = "git";
    gcm = "git checkout main 2>/dev/null || git checkout master";
    gco = "EDITOR=nvim git commit --patch";
    gd = "git difftool";
    gdc = "git difftool --cached";
    gone = "git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == \"[gone]\" {print $1}' | xargs -r git branch -D";
    gp = "git push";
    gpf = "git push --force-with-lease";
    gpu = "git pull";
    gr = "git rebase --interactive";
    grestore = "git restore --patch --source";
    gst = "git status";
  };
}