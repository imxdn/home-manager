return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        -- Coding
        require('mini.pairs').setup()
        require('mini.surround').setup()
        -- Session
        require('mini.sessions').setup()
    end
}
