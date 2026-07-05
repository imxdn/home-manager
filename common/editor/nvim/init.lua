require("config.options")
require("config.mappings")
require("config.autocmds")
require("config.lazy")

-- Load after lazy.nvim so plugin dependencies (e.g. blink.cmp) are available
require("config.lsp")

-- Load custom overrides if they exist
pcall(require, "custom")
