-- Set leader to <Space> and localleader to \\
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set -- for conciseness

-- General mappings
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map({ "i", "x", "s" }, "<C-s>", "<cmd>w<CR><esc>", { desc = "Save file" })
map("i", "jk", "<ESC>")
map({ "i", "n", "s" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Better up/down (respects word wrap)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better search (centers and unfolds)
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search" })

-- Move lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Buffers (using BufferLine for visual tab order)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
map("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
map("n", "<leader>bd", function() require("snacks").bufdelete() end, { desc = "[b]uffer [d]elete" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "[b]uffer switch to alternate" })
map("n", "<leader>bo", function() require("snacks").bufdelete.other() end, { desc = "[b]uffer delete [o]thers" })
map("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "[b]uffer close [r]ight" })
map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "[b]uffer close [l]eft" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "[q]uit all" })

-- Diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[c]ode [d]iagnostics" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev diagnostic" })
map("n", "]e", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = true }) end, { desc = "Next error" })
map("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = true }) end, { desc = "Prev error" })
map("n", "]w", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = true }) end, { desc = "Next warning" })
map("n", "[w", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN, float = true }) end, { desc = "Prev warning" })

-- Quickfix
map("n", "[q", "<cmd>cprev<cr>", { desc = "Prev quickfix" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })

-- Undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Window management
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>-", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>|", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>wd", "<cmd>close<CR>", { desc = "[w]indow [d]elete" })
map("n", "<leader>w=", "<C-w>=", { desc = "[w]indow equalize" })

-- Window resizing
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[t]ab [o]pen" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[t]ab close" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[t]ab [n]ext" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[t]ab [p]rev" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "[t]ab current [f]ile" })

-- Clipboard mappings (using clipboard = "unnamedplus" instead, see options.lua)
-- map('v', '<leader>y', '"+y', { desc = "Copy to clipboard in visual mode" })
-- map('n', '<leader>Y', '"+yg_', { desc = "Copy from cursor position to EOL in normal mode" })
-- map('n', '<leader>y', '"+y', { desc = "Copy to clipboard using specified motion" })
-- map('n', '<leader>yy', '"+yy', { desc = "Copy to clipboard the line under the cursor" })
-- map('n', '<leader>p', '"+p', { desc = "Paste from clipboard after the cursor" })
-- map('n', '<leader>P', '"+P', { desc = "Paste from clipboard before the cursor" })
-- map('v', '<leader>p', '"+p', { desc = "Paste from clipboard replacing the selected text" })
-- map('v', '<leader>P', '"+P', { desc = "Paste from clipboard replacing the selected text" })
