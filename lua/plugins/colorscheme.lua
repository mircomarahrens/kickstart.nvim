-- colorschemes
return {
    -- add coloschemes here
    {
        "ellisonleao/gruvbox.nvim",
        "folke/tokyonight.nvim",
        "loctvl842/monokai-pro.nvim",
    },
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    }
}
