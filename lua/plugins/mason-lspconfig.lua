-- https://github.com/williamboman/mason-lspconfig.nvim
-- mason-lspconfig bridges mason.nvim with the lspconfig plugin
return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local lsp_zero = require("lsp-zero")
        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "cmake",
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
}
