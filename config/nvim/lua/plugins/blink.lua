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
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

        },
        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },
        completion = {
            list = { selection = 'manual' },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            ghost_text = { enabled = true },
        },
        -- Default list of enabled providers defined so that you can extend it
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            cmdline = {},
        },
    },
    opts_extend = { "sources.default" }
}
