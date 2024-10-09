return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "folke/todo-comments.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local telescope = require "telescope"
        local builtin = require("telescope.builtin")

        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case"
            }
        }

        telescope.load_extension "fzf"

        -- Keymaps
        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        keymap.set("n", "<leader>gt", builtin.git_status, { desc = "Telescope git" })
        keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {
            desc = "Find todos"
        })
    end
}
