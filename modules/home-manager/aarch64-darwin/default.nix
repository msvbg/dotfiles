{ config, pkgs, lib, ... }: {
  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "vscode"
      "vscode-extension-ms-dotnettools-csharp"
      "vscode-extension-ms-dotnettools-csdevkit"
      "vscode-extension-ms-dotnettools-vscode-dotnet-runtime"
      "vscode-extension-supermaven-supermaven"
    ];
  };

  home.packages = with pkgs; [
    coreutils
    lld # Useful for fast Rust linking on macOS
  ];

  home.sessionVariables = { };
}
