return {
    'stevearc/conform.nvim',
    lazy = true,
    keys = {
        {
            '<leader>cf',
            function()
                local conform = require("conform")
                conform.format({
                    async = false,
                    timeout_ms = 500
                })
            end,
            mode = {'n', 'x'},
            desc = "Formatter: [c]ode [f]ormat in current buffer"
        }
    },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                css = { "prettierd", stop_after_first = true },
                html = { "prettierd", stop_after_first = true },
                javascript = { "prettierd", stop_after_first = true },
                json = { "prettierd", stop_after_first = true },
                lua = { "stylua" },
                markdown = { "prettierd", stop_after_first = true },
                -- python = { "ruff" },
                rust = { "rustfmt", lsp_format = "fallback" },
                typescript = { "prettierd", stop_after_first = true },
                yaml = { "prettierd", stop_after_first = true },
            },
        })

        vim.keymap.set({'n', 'x'}, '<leader>cf', function()
            conform.format({
                async = false,
                timeout_ms = 500,
                lsp_fallback = true
            })
        end, { desc = "Formatter: [c]ode [f]ormat in current buffer"})
    end
}
