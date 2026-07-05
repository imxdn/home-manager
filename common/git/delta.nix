{ config, ... }:
let
  c = config.lib.stylix.colors.withHashtag;
in
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      dark = true;
      line-numbers = true;
      side-by-side = true;
      syntax-theme = "base16";

      file-style = c.base05;
      file-decoration-style = "${c.base03} ul";
      file-added-label = "[+]";
      file-modified-label = "[*]";
      file-removed-label = "[-]";
      file-renamed-label = "[→]";

      hunk-header-decoration-style = "${c.base00} box";
      hunk-header-file-style = c.base04;
      hunk-header-line-number-style = c.base0A;
      hunk-header-style = "file line-number syntax";

      line-numbers-minus-style = c.base0F;
      line-numbers-plus-style = c.base0B;
      line-numbers-left-style = c.base03;
      line-numbers-right-style = c.base03;
      line-numbers-zero-style = c.base04;

      # Diff add/remove backgrounds. Hand-mixed muted red/green: base16 has no
      # slot for dim diff backgrounds (base08/base0B are full-saturation and
      # would be blinding here). These stay fixed if the scheme changes.
      minus-style = "syntax \"#3d1f24\"";
      minus-emph-style = "syntax \"#4d2730\"";
      plus-style = "syntax \"#1f3d28\"";
      plus-emph-style = "syntax \"#274d32\"";

      zero-style = "syntax";
      whitespace-error-style = "${c.base08} reverse";
    };
  };
}
