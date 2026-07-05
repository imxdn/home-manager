{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    # Keep fonts under our control
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sizes.terminal = 16;
    };

    # Disabled targets manage their own theming:
    #   neovim   — symlinked config ships its own colorscheme plugin
    #   starship — plain-text starship.toml (uses ANSI colors, which stylix
    #              already sets via the terminal); enabling this would force a
    #              generated config and break live-editing
    targets = {
      neovim.enable = false;
      starship.enable = false;
    };
  };
}
