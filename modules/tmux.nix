{config, pkgs, ...}:
{
    programs.tmux = {
        enable = true;
        keyMode = "vi";
        mouse = true;
        terminal = "xterm-256color";
        plugins = with pkgs; [
            {
                plugin = tmuxPlugins.catppuccin;
                extraConfig = ''
                    set -g @catppuccin_flavor "mocha"
                    set -g @catppuccin_window_status_style "rounded"
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
