local opt = vim.opt

opt.laststatus = 3 -- global statusline
opt.showmode = false

-- Cursor line
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
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

opt.timeoutlen = 400
opt.updatetime = 250

-- Turn off swapfile
opt.swapfile = false

-- Spellcheck
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.opt.spelloptions = 'camel'

