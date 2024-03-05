{ nixpkgs, nix-darwin, self, ... }:
let
  configuration = {
    # Configure the `nix` program itself.
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      cores = 1;
      max-jobs = 1;
    };

    # Automatically deduplicate files
    nix.settings.auto-optimise-store = true;

    # Enable automatic garbage collection
    # nix.gc.automatic = true;

    # Link old commands (nix-shell, nix-build, etc.) to use the same nixpkgs as the flake.
    nix.nixPath = [ "nixpkgs=${nixpkgs}" ];

    # Enable automatic garbage collection.
    nix.gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
in
{
  Martins-MBP = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      configuration
      ./Martins-MBP/configuration.nix
      self.darwinModules.default
    ];
  };
}
