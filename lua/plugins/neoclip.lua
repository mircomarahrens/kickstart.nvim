return {
    -- https://github.com/AckslD/nvim-neoclip.lua
    -- A modern clipboard manager for Neovim
    "AckslD/nvim-neoclip.lua",
    requires = {
        -- you'll need at least one of these
        {'nvim-telescope/telescope.nvim'},
        -- {'ibhagwan/fzf-lua'},
    },
    config = function()
        require('neoclip').setup()
    end,
}
