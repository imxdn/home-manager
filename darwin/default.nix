{ config, ... }:
{
  imports = [ ./homebrew.nix ];

  # Lix installer owns the daemon and /etc/nix/nix.conf — don't let nix-darwin fight it.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 5;
  # system.primaryUser is set by lib.mkDarwin from the host's username.

  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
      mru-spaces = false;
      tilesize = 48;
      expose-animation-duration = 0.1;
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
      FXEnableExtensionChangeWarning = false;
      _FXSortFoldersFirst = true;
    };

    NSGlobalDomain = {
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSDocumentSaveNewDocumentsToCloud = false;
    };

    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
    };

    screencapture = {
      location = "${config.users.users.${config.system.primaryUser}.home}/Pictures/Screenshots";
      type = "png";
    };

    LaunchServices.LSQuarantine = false;
    WindowManager.EnableStandardClickToShowDesktop = false;
  };

  # screencapture.location silently falls back to Desktop if the dir is missing.
  system.activationScripts.screenshotsDir.text = ''
    mkdir -p "${config.users.users.${config.system.primaryUser}.home}/Pictures/Screenshots"
  '';

  security.pam.services.sudo_local.touchIdAuth = true;
}
