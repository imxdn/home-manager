return {
    'stevearc/conform.nvim',
    lazy = true,
    keys = {
        {
            '<leader>cf',
            function()
                require("conform").format()
            end,
            mode = {'n', 'x'},
            desc = "[c]ode [f]ormat"
        }
    },
    opts = {
        -- No format_on_save - manual formatting only
        default_format_opts = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            css = { "prettierd", stop_after_first = true },
            html = { "prettierd", stop_after_first = true },
            javascript = { "prettierd", stop_after_first = true },
            json = { "prettierd", stop_after_first = true },
            lua = { "stylua" },
            markdown = { "prettierd", stop_after_first = true },
            python = { "ruff_format" },
            rust = { "rustfmt" },
            typescript = { "prettierd", stop_after_first = true },
            yaml = { "prettierd", stop_after_first = true },
        },
    },
}
