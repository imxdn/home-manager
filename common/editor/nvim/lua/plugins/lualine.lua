return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "folke/noice.nvim" },
    config = function()
        require("lualine").setup {
            options = {
                globalstatus = true,            
                icons_enabled = true,
                theme = "auto",
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' }
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                lualine_b = { "branch" },
                lualine_c = {
                    { "diagnostics", symbols = { error = " ", warn = " ", hint = " ", info = " " } },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1 },
                },
                lualine_x = {
                    {
                        require("noice").api.status.message.get_hl,
                        cond = require("noice").api.status.message.has,
                    },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                    },
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                    },
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                    },
                },
                lualine_y = { { "diff", source = function() local g = vim.b.gitsigns_status_dict; if not g then return {} end; return { added = g.added, modified = g.changed, removed = g.removed } end, symbols = { added = " ", modified = " ", removed = " " } }, "filetype", "progress" },
                lualine_z = {
                    { "location", separator = { right = "" }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = { "lazy", "fzf", "trouble", "nvim-dap-ui" },
        }
    end,
}