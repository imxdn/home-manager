return {
    "folke/snacks.nvim",
    dependencies = {
        "echasnovski/mini.nvim",
    },
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        scope = { enabled = true },
        animate = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true }, -- Wrap notifications
            },
        },
        words = { enabled = true },
        terminal = {
            win = {
                keys = {
                    nav_h = { "<C-h>", "<cmd>wincmd h<cr>", desc = "Go to Left Window", expr = true, mode = "t" },
                    nav_j = { "<C-j>", "<cmd>wincmd j<cr>", desc = "Go to Lower Window", expr = true, mode = "t" },
                    nav_k = { "<C-k>", "<cmd>wincmd k<cr>", desc = "Go to Upper Window", expr = true, mode = "t" },
                    nav_l = { "<C-l>", "<cmd>wincmd l<cr>", desc = "Go to Right Window", expr = true, mode = "t" },
                },
            },
        },
        win = { style = "terminal" },
        gitbrowse = {
            remote_patterns = {
                { "^(https?://.*)%.git$"              , "%1" },
                { "^git@(.+):(.+)%.git$"              , "https://%1/%2" },
                { "^git@(.+):(.+)$"                   , "https://%1/%2" },
                { "^git@(.+)/(.+)$"                   , "https://%1/%2" },
                { "^org%-%d+@(.+):(.+)%.git$"         , "https://%1/%2" },
                { "^ssh://git@(.*)$"                  , "https://%1" },
                { "^ssh://([^:/]+)(:%d+)/(.*)$"       , "https://%1/%3" },
                { "^ssh://([^/]+)/(.*)$"              , "https://%1/%2" },
                { "ssh%.dev%.azure%.com/v3/(.*)/(.*)$", "dev.azure.com/%1/_git/%2" },
                { "^https://%w*@(.*)"                 , "https://%1" },
                { "^git@(.*)"                         , "https://%1" },
                { ":%d+"                              , "" },
                { "%.git$"                            , "" },
            },
            url_patterns = {
                ["github%.com"] = {
                    branch = "/tree/{branch}",
                    file = "/blob/{branch}/{file}#L{line_start}-L{line_end}",
                    permalink = "/blob/{commit}/{file}#L{line_start}-L{line_end}",
                    commit = "/commit/{commit}",
                },
                ["gitlab%.com"] = {
                    branch = "/-/tree/{branch}",
                    file = "/-/blob/{branch}/{file}#L{line_start}-L{line_end}",
                    permalink = "/-/blob/{commit}/{file}#L{line_start}-L{line_end}",
                    commit = "/-/commit/{commit}",
                },
                ["bitbucket%.org"] = {
                    branch = "/src/{branch}",
                    file = "/src/{branch}/{file}#lines-{line_start}-L{line_end}",
                    permalink = "/src/{commit}/{file}#lines-{line_start}-L{line_end}",
                    commit = "/commits/{commit}",
                },
                ["git.sr.ht"] = {
                    branch = "/tree/{branch}",
                    file = "/tree/{branch}/item/{file}",
                    permalink = "/tree/{commit}/item/{file}#L{line_start}",
                    commit = "/commit/{commit}",
                }
            },
        }
    },
    keys = {
        { "<leader>gg", function() Snacks.lazygit() end, desc = "[g]it: lazy[g]it" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File [e]xplorer" },
        { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
        { "<leader>gB", function() Snacks.gitbrowse() end, mode = { "n", "x" }, desc = "[g]it [B]rowse (open)" },
        { "<leader>gY", function() Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false }) end, mode = { "n", "x" }, desc = "[g]it [Y]ank URL" },
    }
}

