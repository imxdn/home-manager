{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      path = "${config.xdg.configHome}/zsh/.zsh_history";
      size = 50000;
      save = 50000;
      extended = true;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    autocd = true;

    autosuggestion.enable = true;

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh";
      }
    ];

    completionInit = ''
      fpath+="${pkgs.zsh-completions}/share/zsh/site-functions"
      autoload -U compinit && compinit -C
    '';

    shellAliases = {
      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      # Better defaults
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -iv";
      mkdir = "mkdir -pv";
      # List (eza)
      ls = "eza --color=always --icons";
      l = "eza -lah --icons";
      la = "eza -lAh --icons";
      ll = "eza -lh --icons";
      lt = "eza -lah --tree --level=2 --icons";
      # Better cat
      cat = "bat --style=auto";
      # Shortcuts
      h = "history";
      c = "clear";
      q = "exit";
      v = "nvim";
      # Tmux
      ta = "tmux attach -t";
      tls = "tmux ls";
      tn = "tmux new -s";
      tk = "tmux kill-session -t";
      # Reload
      reload = "source ~/.zshrc";
    };

    initContent = ''
      # Directory stack
      setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT

      # Globbing
      setopt EXTENDED_GLOB GLOB_DOTS

      # Environment
      export EDITOR="nvim"
      export VISUAL="nvim"
      export PAGER="less"
      export LESS="-R -F -X"

      # Autosuggestion strategy — include atuin history
      ZSH_AUTOSUGGEST_STRATEGY=(history completion atuin)

      source <(fzf --zsh)
      bindkey "^r" atuin-search

      [[ -f ~/.aliases ]] && source ~/.aliases

      # AWS CLI completion
      if command -v aws_completer &>/dev/null; then
        autoload bashcompinit && bashcompinit
        complete -C aws_completer aws
      fi
    '';
  };
}
