{ pkgs, ... }:
let
  packagedExtensions = with pkgs.vscode-extensions; [
    github.copilot
    vscodevim.vim
    bbenoist.nix
    tamasfe.even-better-toml
    rust-lang.rust-analyzer-nightly # from fenix overlay
  ];
  marketplaceExtensions = (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "git-line-blame";
      publisher = "carlthome";
      version = "0.6.1";
      sha256 = "sha256-Jh4DmLEoCsA0lY1ad3jMQRhWXEoXmggAKW8Z9QGYJjY=";
    }
 ]);
in
marketplaceExtensions ++ packagedExtensions