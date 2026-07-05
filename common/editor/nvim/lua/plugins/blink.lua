return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    -- use a release tag to download pre-built binaries
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'default',

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            list = { selection = { preselect = false, auto_insert = false } },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            ghost_text = { enabled = true },
        },
        cmdline = {
            enabled = true,
        },
        -- Default list of enabled providers defined so that you can extend it
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
            providers = {
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
            },
        },
    },
    opts_extend = { "sources.default" },
}
