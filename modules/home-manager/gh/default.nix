{ ... }: {
    programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
      gitCredentialHelper.enable = false;
    };
}