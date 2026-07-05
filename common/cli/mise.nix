{ ... }:
{
  programs.mise = {
    enable = true;
    enableZshIntegration = true;

    globalConfig = {
      tools = {
        node = "24";
        python = "3.12";
        rust = "latest";
        uv = "latest";
      };
      settings.experimental = true;
    };
  };
}
