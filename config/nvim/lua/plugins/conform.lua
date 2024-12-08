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
                css = { { "prettierd", "prettier" } },
                html = { { "prettierd", "prettier" } },
                javascript = { { "prettierd", "prettier" } },
                json = { { "prettierd", "prettier" } },
                lua = { "stylua" },
                markdown = { { "prettierd", "prettier" } },
                python = { "ruff" },
                rust = { "rustfmt", lsp_format = "fallback" },
                typescript = { { "prettierd", "prettier" } },
                yaml = { { "prettierd", "prettier" } },
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
