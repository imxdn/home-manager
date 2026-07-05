{ ... }:
{
  programs.bat = {
    enable = true;
    config = {
      style = "numbers,changes,header";
      italic-text = "always";
      map-syntax = [
        "*.conf:INI"
        ".ignore:Git Ignore"
      ];
    };
  };
}
