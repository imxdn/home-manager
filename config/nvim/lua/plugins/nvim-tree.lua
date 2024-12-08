return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()

        -- Disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup {}

        -- Keymaps
        local keymap = vim.keymap -- for conciseness

        -- toggle file explorer
        keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File Explorer: Toggle" })

        -- toggle file explorer on current file
        keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "File Explorer: Toggle on current file" })
    end,
}