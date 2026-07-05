-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Auto-reload files changed outside vim
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    callback = function()
        if vim.o.buftype ~= "nofile" then vim.cmd("checktime") end
    end,
})

-- Equalize splits on window resize
vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Go to last cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(event)
        local exclude = { "gitcommit" }
        if vim.tbl_contains(exclude, vim.bo[event.buf].filetype) then return end
        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        local lcount = vim.api.nvim_buf_line_count(event.buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Close some filetypes with q
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "checkhealth", "qf", "notify", "lspinfo", "gitsigns-blame", "grug-far", "startuptime", "dbout", "tsplayground" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, { buffer = event.buf, silent = true, desc = "Quit buffer" })
        end)
    end,
})

-- Auto create dir when saving
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then return end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Fix conceallevel for JSON files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- Unlist man pages from buffer list
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "man" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

-- Filetype-specific settings are in after/ftplugin/
