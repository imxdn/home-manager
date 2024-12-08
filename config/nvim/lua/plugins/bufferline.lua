return {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            themable = true,
            offsets = {
                { filetype = "NvimTree", highlight = "NvimTreeNormal", text = "File Explorer", separator = true },
            },
        },
    },
}
