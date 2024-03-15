-- https://github.com/nvim-lualine/lualine.nvim
-- A blazing fast and easy to configure neovim statusline written in pure lua.
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                theme = "gruvbox",
            }
        }
    end
}
