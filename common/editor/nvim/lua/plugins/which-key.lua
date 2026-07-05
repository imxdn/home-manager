return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        spec = {
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>gh", group = "hunks" },
            { "<leader>q", group = "quit" },
            { "<leader>s", group = "search" },
            { "<leader>sn", group = "noice" },
            { "<leader>t", group = "tabs" },
            { "<leader>w", group = "windows" },
            { "<leader>x", group = "diagnostics" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "g", group = "goto" },
        },
    },
    init = function()
        vim.o.timeout = true
        -- timeoutlen is set in config/options.lua
    end,
    keys = {{
        "<leader>?",
        function()
            require("which-key").show({
                global = false
            })
        end,
        desc = "Buffer Local Keymaps"
    }}
}
