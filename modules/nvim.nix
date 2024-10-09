{config, pkgs, ...}:

{
    programs.neovim.enable = true;

    /*
        Lazy writes to lazy-lock.json which cannot be done inside the r/o Nix store
        https://discourse.nixos.org/t/neovim-config-read-only/35109/10
    */
    home.file.".config/nvim/".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/config/nvim";
}