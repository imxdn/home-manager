vim.diagnostic.config({
    virtual_lines = { current_line = true },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
})

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({
    "jsonls",
    "lua_ls",
    "markdown_oxide",
    "ty",
    "rust_analyzer",
    "ts_ls",
    "yamlls",
})

vim.lsp.inlay_hint.enable(true)

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP Actions",
    callback = function(event)
        local win = vim.api.nvim_get_current_win()
        vim.wo[win].foldmethod = "expr"
        vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map("n", "K", vim.lsp.buf.hover, "LSP: Show hover information")
        map("n", "gd", "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>", "LSP: [g]o to [d]efinitions")
        map("n", "gD", "<cmd>FzfLua lsp_declarations jump1=true ignore_current_line=true<cr>", "LSP: [g]o to [D]eclaration")
        map("n", "gi", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", "LSP: [g]o to [i]mplementation")
        map("n", "go", "<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>", "LSP: [g]o to type definiti[o]n")
        map("n", "gr", "<cmd>FzfLua lsp_references<cr>", "LSP: [g]o to [r]eferences")
        map("n", "gs", vim.lsp.buf.signature_help, "LSP: [g]o to [s]ignature")
        map("i", "<C-k>", vim.lsp.buf.signature_help, "LSP: Signature help")
        map("n", "<leader>cr", vim.lsp.buf.rename, "LSP: [c]ode [r]ename symbol")
        map("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", "LSP: Select [c]ode [a]ction")
        map("n", "<leader>cs", "<cmd>FzfLua lsp_document_symbols<cr>", "LSP: Do[c]ument [s]ymbols")
        map("n", "<leader>cS", "<cmd>FzfLua lsp_workspace_symbols<cr>", "LSP: Workspace [S]ymbols")
        map("n", "<leader>cl", vim.lsp.codelens.run, "LSP: Run [c]ode[l]ens")
    end,
})
