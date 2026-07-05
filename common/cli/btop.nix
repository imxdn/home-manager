{ ... }:
{
  programs.btop = {
    enable = true;
    settings.color_theme = "stylix";
  };
  # Force home-manager to own btop.conf so btop can't overwrite the theme
  xdg.configFile."btop/btop.conf".force = true;
}
