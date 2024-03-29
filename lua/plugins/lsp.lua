return {
    {
        -- https://github.com/VonHeikemen/lsp-zero.nvim
        -- Collection of functions that will help you setup Neovim's LSP client, so you can get IDE-like features with minimum effort.
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
    },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    -- mason-lspconfig bridges mason.nvim with the lspconfig plugin
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lsp_zero = require("lsp-zero")
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "cmake",
                    "dockerls",
                    "pyright",
                    "pylsp",
                    "gopls",
                    "rust_analyzer"
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        lspconfig.lua_ls.setup(lua_opts)
                    end,
                },
            })

            require("mason-lspconfig").setup_handlers({
                function()
                    lspconfig.gopls.setup({
                        settings = {
                            gopls = {
                                analyses = {
                                    unusedparams = true,
                                },
                                staticcheck = true,
                                gofumpt = true,
                            },
                        },
                    })
                end
            })
        end,
    },
    -- https://github.com/williamboman/mason.nvim
    -- Mason is a plugin for Neovim that provides a simple way to manage your projects.
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
}
