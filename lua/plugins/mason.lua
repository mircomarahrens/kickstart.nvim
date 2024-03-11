-- https://github.com/williamboman/mason.nvim
-- Mason is a plugin for Neovim that provides a simple way to manage your projects.
return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({})
    end
}
