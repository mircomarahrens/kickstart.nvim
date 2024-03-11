-- https://github.com/folke/tokyonight.nvim
-- colorschemes
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd("colorscheme tokyonight-moon")
    end
}
