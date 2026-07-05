{ pkgs, dots, ... }:
{
  home.packages = with pkgs; [
    # Home Manager CLI
    home-manager

    # CLI
    delta
    dust
    eza
    fd
    jq
    mutagen
    pandoc
    procs
    ripgrep
    sd
    tldr

    # Editor
    tree-sitter

    # LSP
    lua-language-server
    markdown-oxide
    pyright
    rust-analyzer
    ty
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server

    # Formatters
    prettierd
    stylua

    # Linters
    eslint_d
    ruff
  ];

  # nh: nicer home-manager switch with diff preview. `flake` lets
  # `nh home switch` run without a path argument.
  programs.nh = {
    enable = true;
    flake = dots;
  };

  home.sessionPath = [
    "$HOME/.bin"
  ];
}
