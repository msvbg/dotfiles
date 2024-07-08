{ pkgs, ... }:
let
  packagedExtensions = with pkgs.vscode-extensions; [
    github.copilot
    vscodevim.vim
    jnoortheen.nix-ide
    ms-python.python
    tamasfe.even-better-toml
    rust-lang.rust-analyzer-nightly # from fenix overlay
    skellock.just
    stkb.rewrap
    a5huynh.vscode-ron
    vadimcn.vscode-lldb
  ];
  marketplaceExtensions = (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "git-line-blame";
      publisher = "carlthome";
      version = "0.9.0";
      sha256 = "sha256-Y3DCkPCbvuLxad2Oz82dIYgPIBLhE1FR8Nb9kw7jEpg=";
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
    {
      name = "serenade";
      publisher = "serenade";
      version = "1.5.3";
      sha256 = "sha256-xbsCe7aqL3M66pTYmt4f5t+5WPto3uANZ1Vz/3RiMio=";
    }
  ]);
in
marketplaceExtensions ++ packagedExtensions
