{config, pkgs, ...}:

{
    programs.fzf = {
        enable = true;

        enableZshIntegration = true;

        colors = {
            "bg+" = "#313244";
            bg = "#1e1e2e";
            fg = "#cdd6f4";
            "fg+" = "#cdd6f4";
            header = "#f38ba8";
            "hl+" = "#f38ba8";
            hl = "#f38ba8";
            info = "#cba6f7";
            marker = "#b4befe";
            pointer = "#f5e0dc";
            prompt = "#cba6f7";
            spinner = "#f5e0dc";
        };

        defaultOptions = [
          "--highlight-line"
          "--info=inline-right"
          "--layout=reverse"
          "--border=none"
        ];
    };
}
