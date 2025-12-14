{ config, pkgs, ... }:

{
    imports = [
        ./modules/fzf.nix
        ./modules/lazygit.nix
        ./modules/nvim.nix
        ./modules/starship.nix
        ./modules/tmux.nix
        ./modules/yazi.nix
        ./modules/zoxide.nix
        ./modules/fish.nix
    ];

    # User and paths data
    home.username = "aimad";
    home.homeDirectory = "/home/aimad";

    # Compatibility with Home Manager releases
    home.stateVersion = "25.11";

    # Nix packages to install
    home.packages = with pkgs; [
        # CLI tools
        awscli2
        bat
        eza
        fd
        ripgrep
        gemini-cli

        # Fonts
        nerd-fonts.jetbrains-mono
    ];

    # Files to create
    home.file = {
    };

    # Session overrides
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    # Program overrides
    programs.fish = {
      enable = true;
      shellAliases = {
        pi = "yay -S";
        pu = "yay -Syu";
      };
    };

    # Home Manager managing home manager
    programs.home-manager.enable = true;
}
