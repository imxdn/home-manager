{ pkgs, ... }:
{
  stylix = {
    enable = true;
    # Active color scheme. Swap themes by pointing this at a different file in
    # this directory (each is a self-contained base16 attrset). See that file
    # for why we hand-author rather than use base16-schemes' tokyo-night-dark.
    base16Scheme = import ./tokyonight-night.nix;

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
