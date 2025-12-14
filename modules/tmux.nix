{config, pkgs, ...}:
{
    programs.tmux = {
        enable = true;
        keyMode = "vi";
        mouse = true;
        terminal = "tmux-256color";
        plugins = with pkgs; [
            {
                plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
                    pluginName = "tokyonight";
                    rtpFilePath = "tokyo-night.tmux";
                    version = "master";
                    src = pkgs.fetchFromGitHub {
                        owner = "janoamaral";
                        repo = "tokyo-night-tmux";
                        rev = "caf6cbb4c3a32d716dfedc02bc63ec8cf238f632";
                        sha256 = "sha256-TOS9+eOEMInAgosB3D9KhahudW2i1ZEH+IXEc0RCpU0=";
                    };
                };
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
