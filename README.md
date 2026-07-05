# home-manager

A modular [Nix flake](https://nixos.wiki/wiki/Flakes) for managing dotfiles and
system configuration with [home-manager](https://github.com/nix-community/home-manager)
and [nix-darwin](https://github.com/nix-darwin/nix-darwin), themed with
[Stylix](https://github.com/nix-community/stylix).

## Layout

```
flake.nix              inputs + wiring (imports ./hosts, exposes formatter)
lib/                   mkHome / mkDarwin builders
common/                cross-platform home-manager modules
  cli/                 bat, btop, direnv, mise, yazi, packages
  git/                 git, delta, lazygit
  shell/               zsh, fzf, atuin, starship, zoxide, carapace
  terminal/            ghostty, tmux
  editor/              neovim (config symlinked live)
  theme.nix            Stylix (base16 tokyo-night)
darwin/                macOS system defaults + homebrew
home/                  per-platform base (linux, darwin)
hosts/                 host registry (declares the configurations)
```

Modules are grouped by category. A category with more than one program is a
directory with a `default.nix` aggregator plus one file per program; a
single-program concern is a flat file.

## Usage

This flake expects to live at `~/.config/home-manager` (a few configs are
symlinked live from there via `mkOutOfStoreSymlink`). Clone it accordingly:

```bash
git clone <this-repo> ~/.config/home-manager
cd ~/.config/home-manager
```

Applying is done with [`nh`](https://github.com/nix-community/nh), which is
enabled in `common/cli/packages.nix` with its flake path pinned to this repo —
so these run from anywhere, no `--flake` argument needed:

```bash
nh home switch      # standalone home-manager (Linux)
nh darwin switch    # macOS (nix-darwin)
```

`nh` wraps the underlying tools and adds a diff preview before activation. The
plain equivalents still work if you prefer them:

```bash
home-manager switch --flake .#personal
darwin-rebuild switch --flake .#<host>
```

Format the tree:

```bash
nix fmt
```

## Adding a host

Hosts are declared in `hosts/default.nix` using the `lib` builders:

```nix
homeConfigurations.myhost = lib.mkHome {
  system = "x86_64-linux";
  username = "me";
  homeDirectory = "/home/me";
  modules = [ ../home/linux.nix ];
};
```

`mkDarwin` follows the same shape for macOS hosts (see `lib/default.nix`).
