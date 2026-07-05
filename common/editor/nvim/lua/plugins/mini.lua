return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        -- Icons (replaces nvim-web-devicons)
        require('mini.icons').setup()
        MiniIcons.mock_nvim_web_devicons()
        -- Coding
        require('mini.pairs').setup()
        require('mini.surround').setup()
        local ai = require('mini.ai')
        ai.setup({
            n_lines = 500,
            custom_textobjects = {
                o = ai.gen_spec.treesitter({ -- code block
                    a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                    i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                }),
                f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
                c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
                a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
                t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
                d = { "%f[%d]%d+" }, -- digits
                u = ai.gen_spec.function_call(), -- function call
                U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- function call without dot
            },
        })
    end
}
