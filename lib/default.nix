# Base config builders. Pure and public-safe: no work-overlay references —
# callers pass any overlays/modules they need. Imported as `import ./lib inputs`.
inputs:
let
  inherit (inputs)
    nixpkgs
    home-manager
    nix-darwin
    stylix
    ;
in
{
  # Standalone home-manager (Linux / cloud desktop).
  mkHome =
    {
      system,
      username,
      homeDirectory,
      overlays ? [ ],
      sharedModules ? [ ],
      modules ? [ ],
    }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system overlays; };
      extraSpecialArgs = {
        inherit inputs;
        dots = "${homeDirectory}/.config/home-manager";
      };
      modules = [
        stylix.homeModules.stylix
        { home = { inherit username homeDirectory; }; }
      ]
      ++ sharedModules
      ++ modules;
    };

  # macOS via nix-darwin, with home-manager as a darwin module so system +
  # user config apply from one `darwin-rebuild switch`.
  mkDarwin =
    {
      system,
      username,
      homeDirectory,
      overlays ? [ ],
      homeSharedModules ? [ ],
      darwinModules ? [ ],
      homeModules ? [ ],
    }:
    nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        { nixpkgs.overlays = overlays; }
        {
          users.users.${username}.home = homeDirectory;
          system.primaryUser = username;
        }
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            backupFileExtension = "hm-bak";
            extraSpecialArgs = {
              inherit inputs;
              dots = "${homeDirectory}/.config/home-manager";
            };
            sharedModules = [
              stylix.homeModules.stylix
              { nixpkgs.overlays = overlays; }
            ]
            ++ homeSharedModules;
            users.${username} = {
              imports = homeModules;
              home.username = username;
            };
          };
        }
      ]
      ++ darwinModules;
    };
}
