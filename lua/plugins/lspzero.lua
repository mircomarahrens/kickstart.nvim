-- https://github.com/VonHeikemen/lsp-zero.nvim
-- Collection of functions that will help you setup Neovim's LSP client, so you can get IDE-like features with minimum effort.
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({buffer = bufnr})
        end)

        lsp.setup()
    end
}
