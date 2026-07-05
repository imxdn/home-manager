return {
    "ibhagwan/fzf-lua",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "[f]zf: find [f]iles" },
        { "<leader>fg", "<cmd>FzfLua grep_project<CR>", desc = "[f]zf: [g]rep files" },
        { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "[f]zf: [b]uffers" },
        { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "[f]zf: find [h]elp" },
        { "<leader>ft", "<cmd>TodoFzfLua<CR>", desc = "[f]zf: find [t]odos" },
    }
}
