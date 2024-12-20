{ pkgs, ... }:
let
  packagedExtensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    jnoortheen.nix-ide
    ms-python.python
    tamasfe.even-better-toml
    rust-lang.rust-analyzer-nightly # from fenix overlay
    skellock.just
    stkb.rewrap
    a5huynh.vscode-ron
    vadimcn.vscode-lldb
    ms-vscode.live-server
    ms-dotnettools.csharp
    ms-dotnettools.csdevkit
    ms-dotnettools.vscode-dotnet-runtime
  ];
  marketplaceExtensions = (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "godot-tools";
      publisher = "geequlim";
      version = "2.3.0";
      sha256 = "sha256-iuSec4PoVxyu1KB2jfCYOd98UrqQjH3q24zOR4VCPgs=";
    }
    {
      name = "stylua";
      publisher = "JohnnyMorganz";
      version = "1.6.3";
      sha256 = "sha256-lwrA2Y0Ds6rRMk3lAgZmvECYa5q5nd8PJGeQ3GTsp7g=";
    }
    {
      name = "luau-lsp";
      publisher = "JohnnyMorganz";
      version = "1.34.0";
      sha256 = "sha256-mztArAuUMfFMNyMljNfGy5wetOoCS9TzBaVdcyCPmjE=";
    }
    {
      name = "wit-idl";
      publisher = "BytecodeAlliance";
      version = "0.3.1";
      sha256 = "sha256-AW+TaVGdXqUxNP0swk6xBNTiFTEn5D2CbF+9LYcTRnU=";
    }
    {
      name = "vscode-coverage-gutters";
      publisher = "ryanluker";
      version = "2.12.0";
      sha256 = "sha256-Dkc/Wqc122fV1r6IUyHOtuRdpbWHL3elAhfxHcY6xtM=";
    }
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
      name = "supermaven";
      publisher = "supermaven";
      version = "1.0.9";
      sha256 = "sha256-2cv6dEn5af3VNAHkXAx9Yr2eqeuLh5Stv/JXLWeiRj4=";
    }
  ]);
in
marketplaceExtensions ++ packagedExtensions
