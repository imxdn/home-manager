{config, pkgs, ...}:

{
    programs.starship = {
        enable = true;

        enableFishIntegration = true;
    };

    xdg.configFile."starship.toml".source = ../config/starship/starship.toml;
}
