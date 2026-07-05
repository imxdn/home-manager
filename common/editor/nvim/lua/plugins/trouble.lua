return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {"<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble: diagnostics"},
        {"<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble: buffer diagnostics"},
        {"<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Trouble: [s]ymbols"},
        {"<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "Trouble: [l]sp defs/refs"},
        {"<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble: [L]ocation list"},
        {"<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble: [Q]uickfix list"}
    }
}
