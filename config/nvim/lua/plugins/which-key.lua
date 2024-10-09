return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern"
    },
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
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
