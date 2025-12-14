{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "fzf-fish";
        src = fzf-fish;
      }
    ];
    interactiveShellInit = ''
      fish_vi_key_bindings
      set fish_greeting ""
    '';
  };
}
