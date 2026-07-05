{ pkgs, lib, ... }:
{
  programs.ghostty = {
    enable = true;
    # macOS: installed via Homebrew cask, so no nix package. Linux: let nix provide it.
    package = lib.mkIf pkgs.stdenv.isDarwin null;
    # theme + font family come from stylix (targets.ghostty). font-size is set
    # explicitly: stylix scales the terminal size by line-height (→ 21.3), which
    # isn't what we want here.
    settings = {
      font-size = lib.mkForce 16;
      font-thicken = true;
      macos-titlebar-style = "tabs";
      link-url = true;

      # Clipboard: allow apps to read/write it (default "ask" prompts on every
      # paste) and drop the unsafe-paste confirmation dialog.
      clipboard-read = "allow";
      clipboard-write = "allow";
      clipboard-paste-protection = false;
    };
  };
}
