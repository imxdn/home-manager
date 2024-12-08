{ config, pkgs, ... }:

{
    programs.zsh = {

        enable = true;

        syntaxHighlighting = {
            enable = true;
        };

        historySubstringSearch = {
            enable = true;
        };

        autosuggestion = {
            enable = true;
            strategy = ["history" "completion"];
        };

        initExtra = ''
            source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

            # Keybinding fix for vim-mode and fzf compatibility
            # https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#execute-extra-commands
            function fzf_init() {
                if [[ $options[zle] = on ]]; then
                    source ${pkgs.fzf}/share/fzf/key-bindings.zsh
                fi
            }
            zvm_after_init_commands+=(fzf_init)
            
            # AWS CLI completion
            autoload -Uz compinit && compinit
            source ${pkgs.awscli2}/share/zsh/site-functions/_aws
            complete -C '${pkgs.awscli2}/bin/aws_completer' aws
        '';
    };
}
