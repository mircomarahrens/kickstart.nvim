-- https://github.com/nvim-lualine/lualine.nvim
-- A blazing fast and easy to configure neovim statusline written in pure lua.
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

        require("lualine").setup({
            options = {
                theme = "gruvbox",
            },
            tabline = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        path = 1
                    },
                },
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            sections = {}
        })

        require("lualine").hide({place = {'sections'}})
    end
}
