return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            mason_lspconfig.setup({
                ensure_installed = {
                    "biome",
                    "ts_ls",
                    "html",
                    "cssls",
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "markdown_oxide"
                }
            })

            local capabilities = cmp_nvim_lsp.default_capabilities()

            mason_lspconfig.setup_handlers {
                -- default handler for installed servers
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                -- configure lua server (with special settings)
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                -- make the language server recognize "vim" global
                                diagnostics = {
                                    globals = {"vim"}
                                },
                                completion = {
                                    callSnippet = "Replace"
                                }
                            }
                        }
                    }
                end
            }
        end
    }
}
