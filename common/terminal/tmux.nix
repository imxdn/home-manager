{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";

    prefix = "C-a";
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 50000;
    mouse = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    resizeAmount = 5;

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = sensible;
        extraConfig = "set -ag terminal-overrides ',xterm-256color:RGB'";
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
      prefix-highlight
      yank
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_window_id_style fsquare
          set -g @tokyo-night-tmux_pane_id_style   hsquare
          set -g @tokyo-night-tmux_zoom_id_style   dsquare
        '';
      }
    ];

    extraConfig = ''
      set -g renumber-windows on
      set -g status-position bottom
      set -g display-panes-time 2000

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window
      unbind '"'
      unbind %

      bind 'v' copy-mode

      bind r source-file ~/.config/tmux/tmux.conf \; display "Tmux config reloaded"

      bind -n M-Left  select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up    select-pane -U
      bind -n M-Down  select-pane -D

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set -g repeat-time 1000
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      bind -n M-s    choose-session
      bind -n M-w    choose-window
      bind N         new-session
      bind -n C-Space switch-client -l

      bind -r "<" swap-window -t -1 -d
      bind -r ">" swap-window -t +1 -d
      bind -r "{" swap-pane -U
      bind -r "}" swap-pane -D

      bind g display-popup -E -w 50% -h 50%
    '';
  };
}
