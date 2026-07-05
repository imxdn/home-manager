local opt = vim.opt

opt.laststatus = 3 -- global statusline
opt.showmode = false

-- Cursor line
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true

opt.confirm = true
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.smoothscroll = true
opt.splitkeep = "screen"
opt.pumblend = 10
opt.pumheight = 10
opt.wildmode = "longest:full,full"

opt.timeoutlen = 400
opt.updatetime = 250

opt.clipboard = "unnamedplus"

-- Turn off swapfile
opt.swapfile = false

opt.inccommand = "nosplit" -- live preview for :s substitutions
opt.linebreak = true -- wrap at word boundaries, not mid-word
opt.shiftround = true -- round indent to shiftwidth multiples
opt.smartindent = true -- smarter auto-indenting
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.formatoptions = "jcroqlnt"
opt.list = true -- show tabs/trailing spaces
opt.virtualedit = "block" -- allow cursor past EOL in visual block mode
opt.conceallevel = 2 -- hide markup for bold/italic in markdown

-- Spellcheck (enabled per filetype via autocmd)
opt.spelllang = 'en_us'
opt.spelloptions = 'camel'

-- Folds (LSP foldexpr is set in config/lsp.lua on LspAttach, this is the fallback)
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
