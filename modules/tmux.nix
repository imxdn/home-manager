{config, pkgs, ...}:
let
    tokyo-night-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "tokyo-night-tmux";
        rtpFilePath = "tokyo-night.tmux";  # Fixes incorrect paths
        version = "v1.5.5";
        src = pkgs.fetchFromGitHub {
            owner = "janoamaral";
            repo = "tokyo-night-tmux";
            rev = "c245a09e06529ce8f8115ec91bd87554dc0618b4";
            sha256 = "sha256-ATaSfJSg/Hhsd4LwoUgHkAApcWZV3O3kLOn61r1Vbag=";
        };
    };
in
{
    programs.tmux = {
        enable = true;

        keyMode = "vi";

        mouse = true;

        terminal = "xterm-256color";

        plugins = with pkgs; [
          {
            plugin = tokyo-night-tmux;
            extraConfig = ''
                set -g @tokyo-night-tmux_window_id_style fsquare
                set -g @tokyo-night-tmux_pane_id_style hsquare
                set -g @tokyo-night-tmux_zoom_id_style dsquare
            '';
          }
          tmuxPlugins.vim-tmux-navigator
          tmuxPlugins.yank
          {
            plugin = tmuxPlugins.resurrect;
            extraConfig = ''
                set -g @resurrect-strategy-nvim 'session'
                set -g @resurrect-capture-pane-contents 'on'
            '';
        }
        ];

        extraConfig = builtins.readFile ../config/tmux/tmux.conf;
    };
}