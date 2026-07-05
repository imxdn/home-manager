{ ... }:
{
  imports = [
    ./cli
    ./editor
    ./git
    ./shell
    ./terminal
    ./theme.nix
  ];

  home.stateVersion = "26.05";
}
