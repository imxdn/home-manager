return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        current_line_blame = true,
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        on_attach = function(buf)
            local gs = require("gitsigns")

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buf, desc = desc })
            end

            map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
            map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
            map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "[g]it [h]unk [s]tage")
            map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "[g]it [h]unk [r]eset")
            map("n", "<leader>ghS", gs.stage_buffer, "[g]it [h]unk [S]tage buffer")
            map("n", "<leader>ghu", gs.undo_stage_hunk, "[g]it [h]unk [u]ndo stage")
            map("n", "<leader>ghR", gs.reset_buffer, "[g]it [h]unk [R]eset buffer")
            map("n", "<leader>ghp", gs.preview_hunk_inline, "[g]it [h]unk [p]review")
            map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "[g]it [h]unk [b]lame line")
            map("n", "<leader>ghB", function() gs.blame() end, "[g]it [h]unk [B]lame buffer")
            map("n", "<leader>ght", gs.toggle_current_line_blame, "[g]it [h]unk [t]oggle blame")
            map("n", "<leader>ghd", gs.diffthis, "[g]it [h]unk [d]iff")
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
        end,
    },
}
