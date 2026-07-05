return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
    },
    -- stylua: ignore
    keys = {
        { "<leader>sn", "", desc = "+noice"},
        { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
        { "<leader>snl", function() require("noice").cmd("last") end, desc = "[s]earch [n]oice [l]ast" },
        { "<leader>snh", function() require("noice").cmd("history") end, desc = "[s]earch [n]oice [h]istory" },
        { "<leader>sna", function() require("noice").cmd("all") end, desc = "[s]earch [n]oice [a]ll" },
        { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "[s]earch [n]oice [d]ismiss" },
        { "<leader>snt", function() require("noice").cmd("pick") end, desc = "[s]earch [n]oice pick[t]er" },
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
        { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
    config = function(_, opts)
        -- HACK: noice shows messages from before it was enabled,
        -- but this is not ideal when Lazy is installing plugins,
        -- so clear the messages in this case.
        if vim.o.filetype == "lazy" then
            vim.cmd [[messages clear]]
        end
        require("noice").setup(opts)
    end,
}

