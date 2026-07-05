{ ... }:
{
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type f --hidden --follow --exclude .git";

    fileWidget = {
      command = "fd --type f --hidden --follow --exclude .git";
      options = [
        "--walker-skip .git,node_modules,target"
        "--preview 'bat -n --color=always {}'"
        "--preview-window=right:60%:wrap"
        "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
      ];
    };

    changeDirWidget = {
      command = "fd --type d --hidden --follow --exclude .git";
      options = [
        "--walker-skip .git,node_modules,target"
        "--preview 'eza --tree --color=always {} | head -200 2>/dev/null || ls -la {}'"
        "--preview-window=right:50%:wrap"
        "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
      ];
    };

    historyWidget.options = [
      "--sort"
      "--exact"
      "--bind 'ctrl-/:toggle-sort'"
      # Portable clipboard: pbcopy (macOS), else wl-copy/xclip (Linux)
      "--bind 'ctrl-y:execute-silent(echo -n {2..} | (pbcopy || wl-copy || xclip -selection clipboard) 2>/dev/null)+abort'"
      "--color 'header:italic'"
      "--header 'Press CTRL-Y to copy command into clipboard'"
    ];

    defaultOptions = [
      "--highlight-line"
      "--info=inline-right"
      "--ansi"
      "--layout=reverse"
      "--border=none"
      "--height=40%"
      "--multi"
      "--cycle"
      "--preview-window=right:50%:wrap"
    ];

    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-p 80%,60%" ];
    };
  };
}
