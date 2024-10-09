{ config, pkgs, ... }:

{
    imports = [
        ./modules/fzf.nix
        ./modules/nvim.nix
        ./modules/starship.nix
        ./modules/tmux.nix
        ./modules/zoxide.nix
        ./modules/zsh.nix
    ];

    # User and paths data
    home.username = "aimad";
    home.homeDirectory = "/home/aimad";

    # Compatbility with Home Manager releases
    home.stateVersion = "24.05";

    # Nix packages to install
    home.packages = with pkgs; [
        # CLI tools
        awscli2
        bat
        eza
        fd
        ripgrep

        # Fonts
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    # Files to create
    home.file = {
    };

    # Session overrides
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    # Program overrides
    programs = {
        zsh = {
            shellAliases = {
                pi = "yay -S";
                pu = "yay -Syu";
            };
        };
    };

    # Home Manager managing home manager
    programs.home-manager.enable = true;
}
