return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint");

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            python = { "ruff" },
            rust = { "clippy" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
            callback = function ()
                lint.try_lint()
            end
        })

        vim.keymap.set("n", "<leader>cL", function()
            lint.try_lint()
        end, { desc = "[c]ode [L]int buffer"}
        )
    end
}
