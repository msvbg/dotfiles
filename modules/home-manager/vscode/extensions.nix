{ pkgs, ... }:
let
  packagedExtensions = with pkgs.vscode-extensions; [
    github.copilot
    vscodevim.vim
    jnoortheen.nix-ide
    tamasfe.even-better-toml
    rust-lang.rust-analyzer-nightly # from fenix overlay
    skellock.just
    stkb.rewrap
  ];
  marketplaceExtensions = (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "git-line-blame";
      publisher = "carlthome";
      version = "0.6.1";
      sha256 = "sha256-Jh4DmLEoCsA0lY1ad3jMQRhWXEoXmggAKW8Z9QGYJjY=";
    }
    {
      name = "wgsl";
      publisher = "polymeilex";
      version = "0.1.17";
      sha256 = "sha256-vGqvVrr3wNG6HOJxOnJEohdrzlBYspysTLQvWuP0QIw=";
    }
    {
      name = "ayu";
      publisher = "teabyii";
      version = "1.0.5";
      sha256 = "sha256-+IFqgWliKr+qjBLmQlzF44XNbN7Br5a119v9WAnZOu4=";
    }
  ]);
in
marketplaceExtensions ++ packagedExtensions
