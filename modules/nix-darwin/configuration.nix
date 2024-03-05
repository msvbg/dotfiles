{ pkgs, ... }: {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        vim
        git
    ];

    programs.zsh.enable = true; 

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    nix.package = pkgs.nix;

    # Enable fingerprint scanner for authentication.
    security.pam.enableSudoTouchIdAuth = true;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 4;

    system.keyboard.enableKeyMapping = true;
    system.keyboard.remapCapsLockToEscape = true;

    system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        dock.show-recents = false;

        # Disable all hot corners
        dock.wvous-bl-corner = 1;
        dock.wvous-br-corner = 1;
        dock.wvous-tl-corner = 1;
        dock.wvous-tr-corner = 1;

        # Finder settings
        finder.AppleShowAllExtensions = true;
        finder.QuitMenuItem = true;
        finder.FXEnableExtensionChangeWarning = false;
        finder._FXShowPosixPathInTitle = true;
        finder.ShowStatusBar = true;
        finder.ShowPathbar = true;

        # Trackpad behavior
        trackpad.Clicking = true; 
        trackpad.TrackpadThreeFingerDrag = true;
        NSGlobalDomain."com.apple.swipescrolldirection" = true;
        NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;

        # Keyboard behavior 
        NSGlobalDomain.InitialKeyRepeat = 15;
        NSGlobalDomain.KeyRepeat = 1;
        NSGlobalDomain.ApplePressAndHoldEnabled = false;
        NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
        NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

        NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
        NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;
    };

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";

    # https://medium.com/@zmre/nix-darwin-quick-tip-activate-your-preferences-f69942a93236
    system.activationScripts.postUserActivation.text = ''
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
}
