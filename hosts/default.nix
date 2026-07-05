# Host registry. Public hosts are declared here directly; a private work
# overlay may live in ./work (imported only when present), so this file and
# flake.nix stay identical whether or not the overlay is checked out.
{ inputs, lib }:
let
  # Private work overlay (absent in the public repo). Empty set when missing.
  work =
    if builtins.pathExists ./work/default.nix then import ./work { inherit inputs lib; } else { };

  # Example public host — a standalone home-manager config on Linux. Adjust the
  # username/homeDirectory (or add your own hosts) and build with:
  #   home-manager switch --flake .#personal
  base = {
    homeConfigurations.personal = lib.mkHome {
      system = "x86_64-linux";
      username = "user";
      homeDirectory = "/home/user";
      modules = [ ../home/linux.nix ];
    };
  };
in
# recursiveUpdate (not //) so both layers' homeConfigurations/darwinConfigurations
# merge instead of one class replacing the other.
inputs.nixpkgs.lib.recursiveUpdate base work
