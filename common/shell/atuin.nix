{ config, ... }:
let
  c = config.lib.stylix.colors.withHashtag;
in
{
  # atuin has no stylix target, so we hand-roll a theme from stylix.colors.
  # Named "stylix" (not the scheme name) so it never goes stale when the scheme changes.
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
      "--disable-up-arrow"
      "--disable-ctrl-r"
    ];

    settings = {
      style = "compact";
      show_preview = true;
      update_check = false;
      auto_sync = false;
      theme = {
        name = "stylix";
      };
      filter_mode_shell_up_key_binding = "session";
      history_filter = [
        "^ls"
        "^cd"
        "^z "
        "^pwd$"
        "^exit$"
        "^clear$"
        "^c$"
        "^q$"
      ];
    };

    themes."stylix" = {
      colors = {
        Base = c.base00;
        Overlay = c.base01;
        Surface = c.base02;
        Text = c.base05;
        Subtext = c.base04;
        Muted = c.base03;
        Annotation = c.base0C;
        Guidance = c.base0D;
        Important = c.base0E;
        AlertInfo = c.base0B;
        AlertWarn = c.base0A;
        AlertError = c.base08;
      };
    };
  };
}
