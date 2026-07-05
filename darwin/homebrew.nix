{ ... }:
{
  # GUI apps only; CLI tools go in nix (home.packages).
  homebrew = {
    enable = true;

    # zap: uninstall + delete data for anything not declared here
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [ ];
    brews = [ ];

    casks = [
      "bruno"
      "ghostty"
      "insomnia"
      "maccy"
      "obsidian"
    ];
  };
}
