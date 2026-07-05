return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    opts = {
        options = {
            themable = true,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diag)
                local icons = { Error = " ", Warn = " " }
                local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                    .. (diag.warning and icons.Warn .. diag.warning or "")
                return vim.trim(ret)
            end,
            offsets = {
                { filetype = "snacks_layout_box" },
            },
        },
    },
    keys = {
        { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "[b]uffer [p]in toggle" },
        { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "[b]uffer delete non-[P]inned" },
    },
}
