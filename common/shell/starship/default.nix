{ dots, ... }:
{
  programs.starship = {
    enable = true;
    # Plain-text config — edit starship.toml directly without rebuilding
    configPath = "${dots}/common/shell/starship/starship.toml";
  };
}
