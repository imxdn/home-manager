return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
        { "<leader>qs", function() require("persistence").load() end, desc = "[q]uit: re[s]tore session" },
        { "<leader>qS", function() require("persistence").select() end, desc = "[q]uit: [S]elect session" },
        { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "[q]uit: [l]ast session" },
        { "<leader>qd", function() require("persistence").stop() end, desc = "[q]uit: [d]on't save session" },
    },
}
