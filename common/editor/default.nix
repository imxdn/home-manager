{
  config,
  dots,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ neovim ];

  # Symlink the whole nvim config directory — edits are immediately live
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${dots}/common/editor/nvim";
}
