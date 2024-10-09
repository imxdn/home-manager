return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Default options:
        require("tokyonight").setup {
            style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        }
        vim.o.background = "dark"
        vim.cmd.colorscheme('tokyonight')
    end,
}
