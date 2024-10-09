-- Set leader to <Space> and localleader to \\
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set -- for conciseness

-- General mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- Clear search highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Copy to clipboard
map('v', '<leader>y', '"+y', { desc = "Copy to clipboard in visual mode" })
map('n', '<leader>Y', '"+yg_', { desc = "Copy from cursor position to EOL in normal mode" })
map('n', '<leader>y', '"+y', { desc = "Copy to clipboard using specified motion" })
map('n', '<leader>yy', '"+yy', { desc = "Copy to clipboard the line under the cursor" })

-- Paste from clipboard
map('n', '<leader>p', '"+p', { desc = "Paste from clipboard after the cursor" })
map('n', '<leader>P', '"+P', { desc = "Paste from clipboard before the cursor" })
map('v', '<leader>p', '"+p', { desc = "Paste from clipboard replacing the selected text" })
map('v', '<leader>P', '"+P', { desc = "Paste from clipboard replacing the selected text" })
