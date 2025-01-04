return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            }
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lspconfig = require "mason-lspconfig"

            mason_lspconfig.setup {
                ensure_installed = {
                    -- lua
                    "lua_ls",
                    -- markdown
                    "markdown_oxide",
                    -- nix
                    "nil_ls",
                    -- python
                    "pyright",
                    -- rust
                    "rust_analyzer",
                    -- web
                    "biome",
                    "ts_ls",
                },
                automation_installation = true,
            }

            mason_lspconfig.setup_handlers {
                -- default handler for installed servers
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                -- configure lua server (with special settings)
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                                workspace = {
                                    library = { vim.env.VIMRUNTIME },
                                },
                            },
                        },
                    }
                end,

                ["biome"] = function()
                    require'lspconfig'.biome.setup {
                        root_dir = function()
                            return vim.fn.getcwd()  -- Always attach by using current working directory as root
                        end,
                    }
                end,
            }
        end,
    },
}
