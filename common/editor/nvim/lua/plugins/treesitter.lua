return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        version = false,
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local parsers = {
                "bash",
                "c",
                "css",
                "dockerfile",
                "gitignore",
                "html",
                "java",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "rust",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            }

            require("nvim-treesitter").install(parsers)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "VeryLazy",
        opts = {
            move = {
                enable = true,
                set_jumps = true,
                keys = {
                    goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
                    goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
                    goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
                    goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter-textobjects").setup(opts)
        end,
    },
}
