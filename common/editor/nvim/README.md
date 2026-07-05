# Neovim Configuration

Personal Neovim configuration built from scratch using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. No distro — just a clean, modular setup.

Requires **Neovim 0.11+** (uses native `vim.lsp.config`, `vim.lsp.enable`, and `vim.lsp.foldexpr`).

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point — loads config modules in order
├── .stylua.toml                # Lua formatter config
├── lazy-lock.json              # Plugin version lockfile
├── lua/
│   ├── config/
│   │   ├── options.lua         # vim.opt settings (indent, UI, folds, clipboard)
│   │   ├── mappings.lua        # Leader key + global keymaps
│   │   ├── autocmds.lua        # Autocommands (yank highlight, last cursor, etc.)
│   │   ├── lazy.lua            # Plugin manager bootstrap and setup
│   │   └── lsp.lua             # LSP servers, diagnostics, and LSP keymaps
│   ├── plugins/                # One file per plugin (auto-imported by lazy.nvim)
│   │   ├── blink.lua           # Completion (blink.cmp)
│   │   ├── bufferline.lua      # Buffer tabs
│   │   ├── colorscheme.lua     # Ayu dark theme
│   │   ├── conform.lua         # Formatting (manual, no format-on-save)
│   │   ├── flash.lua           # Jump/motion navigation
│   │   ├── fzf.lua             # Fuzzy finder (fzf-lua)
│   │   ├── gitsigns.lua        # Git gutter signs + hunk operations
│   │   ├── grug-far.lua        # Search and replace
│   │   ├── harpoon.lua         # Quick file marks (harpoon2)
│   │   ├── lazydev.lua         # Lua LSP dev helpers
│   │   ├── lspconfig.lua       # nvim-lspconfig (provides server configs)
│   │   ├── lualine.lua         # Statusline
│   │   ├── mini.lua            # mini.nvim (icons, pairs, surround, ai)
│   │   ├── noice.lua           # UI for messages, cmdline, popupmenu
│   │   ├── nvim-lint.lua       # Linting (auto on save/read + manual)
│   │   ├── persistence.lua     # Session management (auto-save on exit)
│   │   ├── snacks.lua          # Snacks (explorer, dashboard, terminal, etc.)
│   │   ├── todo-comments.lua   # TODO/FIXME/HACK highlighting + navigation
│   │   ├── treesitter.lua      # Syntax highlighting + textobjects
│   │   ├── trouble.lua         # Diagnostics list
│   │   └── which-key.lua       # Keymap hints
│   └── custom/
│       └── plugins/            # Machine-specific plugin overrides (optional)
└── after/
    └── ftplugin/               # Filetype-specific overrides
        ├── markdown.lua        # Spell + wrap for markdown
        ├── gitcommit.lua       # Spell + wrap for commits
        └── text.lua            # Spell + wrap for plain text
```

## Boot Sequence

1. `options.lua` — vim settings, clipboard, folds (treesitter fallback)
2. `mappings.lua` — leader key (`<Space>`), global keymaps
3. `autocmds.lua` — yank highlight, restore cursor, auto-mkdir, close-with-q
4. `lazy.lua` — bootstrap lazy.nvim, load all plugins from `lua/plugins/`
5. `lsp.lua` — diagnostics config, LSP server enable, inlay hints, LSP keymaps

LSP loads last because it depends on blink.cmp for capabilities.

## LSP

Uses Neovim 0.11+ native LSP (no lspconfig `setup()` calls):

| Server          | Language              |
|-----------------|-----------------------|
| `lua_ls`        | Lua                   |
| `ts_ls`         | TypeScript/JavaScript |
| `rust_analyzer` | Rust                  |
| `ty`            | Python (ty)           |
| `jsonls`        | JSON                  |
| `yamlls`        | YAML                  |
| `markdown_oxide`| Markdown              |

Inlay hints are enabled globally. Folds use `vim.lsp.foldexpr()` when an LSP attaches, falling back to treesitter folds otherwise.

## Keymaps

Leader is `<Space>`. Descriptions use `[x]` bracket notation for which-key mnemonic highlighting.

### General

| Key | Mode | Action |
|-----|------|--------|
| `<C-s>` | n/i/x/s | Save file |
| `jk` | i | Escape to normal mode |
| `<Esc>` | i/n/s | Escape and clear search highlights |
| `j`/`k` | n/x | Smart up/down (respects wrap) |
| `n`/`N` | n | Consistent search direction (n=forward, N=backward) |
| `<A-j>`/`<A-k>` | n/v | Move line(s) up/down |
| `<`/`>` | x | Indent and reselect |
| `,` `.` `;` | i | Insert undo break-points |

### Buffers & Tabs

| Key | Action |
|-----|--------|
| `<S-h>`/`<S-l>` | Prev/next buffer |
| `[b`/`]b` | Prev/next buffer |
| `[B`/`]B` | Move buffer left/right |
| `<leader>bb` | Switch to alternate buffer |
| `<leader>bd` | Delete buffer |
| `<leader>bo` | Delete other buffers |
| `<leader>br`/`<leader>bl` | Close buffers right/left |
| `<leader>bp` | Toggle pin |
| `<leader>bP` | Delete non-pinned buffers |
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn`/`<leader>tp` | Next/prev tab |
| `<leader>tf` | Open current file in new tab |

### Windows

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate windows |
| `<C-Up/Down/Left/Right>` | Resize windows |
| `<leader>-` | Split horizontal |
| `<leader>\|` | Split vertical |
| `<leader>wd` | Close window |
| `<leader>w=` | Equalize windows |

### LSP (active in LSP-attached buffers)

| Key | Mode | Action |
|-----|------|--------|
| `K` | n | Hover information |
| `gd` | n | Go to definition (fzf-lua) |
| `gD` | n | Go to declaration (fzf-lua) |
| `gi` | n | Go to implementation (fzf-lua) |
| `go` | n | Go to type definition (fzf-lua) |
| `gr` | n | Go to references (fzf-lua) |
| `gs` | n | Signature help |
| `<C-k>` | i | Signature help |
| `<leader>cr` | n | Rename symbol |
| `<leader>ca` | n | Code actions (fzf-lua) |
| `<leader>cs` | n | Document symbols (fzf-lua) |
| `<leader>cS` | n | Workspace symbols (fzf-lua) |
| `<leader>cl` | n | Run codelens |
| `<leader>cd` | n | Line diagnostics |
| `<leader>cf` | n/x | Format (conform) |
| `<leader>cL` | n | Lint buffer |
| `]d`/`[d` | n | Next/prev diagnostic |
| `]e`/`[e` | n | Next/prev error |
| `]w`/`[w` | n | Next/prev warning |

### Search & Find (fzf-lua)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Grep project |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>ft` | Find TODOs |
| `<leader>sr` | Search and replace (grug-far, scoped to filetype) |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Lazygit |
| `<leader>gB` | Git browse (open in browser) |
| `<leader>gY` | Git browse (yank URL) |
| `]h`/`[h` | Next/prev hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghS` | Stage buffer |
| `<leader>ghR` | Reset buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghp` | Preview hunk inline |
| `<leader>ghb` | Blame line |
| `<leader>ghB` | Blame buffer |
| `<leader>ght` | Toggle inline blame |
| `<leader>ghd` | Diff this |
| `ih` | Select hunk (text object) |

### Harpoon

| Key | Action |
|-----|--------|
| `<leader>a` | Add file to harpoon |
| `<leader>h` | Harpoon quick menu |
| `<leader>1-4` | Jump to harpoon file 1-4 |

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `s` | n/x/o | Flash jump |
| `S` | n/x/o | Flash treesitter |
| `<C-s>` | c | Toggle flash search |
| `<C-Space>` | n/x/o | Treesitter incremental selection |

### Text Objects (mini.ai + treesitter)

| Key | Action |
|-----|--------|
| `af`/`if` | Around/inside function |
| `ac`/`ic` | Around/inside class |
| `aa`/`ia` | Around/inside parameter |
| `ao`/`io` | Around/inside block/conditional/loop |
| `at`/`it` | Around/inside tag |
| `ad`/`id` | Around/inside digits |
| `au`/`iu` | Around/inside function call |
| `]f`/`[f` | Next/prev function start |
| `]c`/`[c` | Next/prev class start |
| `]a`/`[a` | Next/prev parameter |
| `]F`/`[F` | Next/prev function end |
| `]C`/`[C` | Next/prev class end |
| `]t`/`[t` | Next/prev TODO comment |

### Trouble

| Key | Action |
|-----|--------|
| `<leader>xx` | Diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xs` | Symbols |
| `<leader>xl` | LSP defs/refs |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

### Sessions

| Key | Action |
|-----|--------|
| `<leader>qs` | Restore session |
| `<leader>qS` | Select session |
| `<leader>ql` | Restore last session |
| `<leader>qd` | Don't save current session |

### Misc

| Key | Action |
|-----|--------|
| `<leader>e` | File explorer (snacks) |
| `<C-/>` | Toggle terminal |
| `<leader>qq` | Quit all |
| `<leader>?` | Buffer local keymaps (which-key) |
| `<leader>sn*` | Noice commands (last, history, all, dismiss, picker) |
| `[q`/`]q` | Prev/next quickfix |

## Formatting & Linting

Formatting is **manual only** (`<leader>cf`). No format-on-save.

| Language | Formatter | Linter |
|----------|-----------|--------|
| Lua | stylua | — |
| JS/TS | prettierd | eslint_d |
| Python | ruff_format | ruff |
| Rust | rustfmt | clippy |
| CSS/HTML/JSON/YAML/Markdown | prettierd | — |

Linting runs automatically on save, read, and insert leave. Manual lint: `<leader>cL`.

## Filetype Overrides

Per-filetype settings live in `after/ftplugin/`. Currently enables spell checking and word wrap for:
- Markdown
- Git commits
- Plain text

Add new files like `after/ftplugin/python.lua` for language-specific overrides.

## Clipboard

Uses `clipboard = "unnamedplus"` — all yanks and pastes go through the system clipboard by default. No separate clipboard keymaps needed.

## Machine-Specific Overrides

The `lua/custom/` directory is conditionally loaded for per-machine customizations without touching the base config:

### Custom Config (`lua/custom/init.lua`)

Create this file to override any base settings — options, mappings, autocmds, or anything else:

```lua
-- Example: lua/custom/init.lua
vim.opt.relativenumber = false
vim.keymap.set("n", "<leader>m", "<cmd>MyCustomCommand<cr>")
```

### Custom Plugins (`lua/custom/plugins/`)

Lazy.nvim auto-loads plugin specs from this directory:

- **Add new plugins** — drop a new file like `custom/plugins/markdown-preview.lua`
- **Override base plugin opts** — create a spec for the same plugin and lazy.nvim deep-merges the `opts`
- **Disable a base plugin** — `return { "existing/plugin", enabled = false }`

This keeps the base config clean and easy to update from upstream.
