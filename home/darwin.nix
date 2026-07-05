{ ... }:
{
  imports = [ ../common ];

  # Hardcoded brew paths — faster than eval "$(brew shellenv)" on every shell start
  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  home.sessionVariables = {
    HOMEBREW_PREFIX = "/opt/homebrew";
    HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
    HOMEBREW_REPOSITORY = "/opt/homebrew";
  };
}
