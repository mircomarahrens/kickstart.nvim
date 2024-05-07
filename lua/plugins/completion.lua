return {
    {
        -- https://github.com/hrsh7th/nvim-cmp
        -- nvim-cmp source for neovim builtin LSP client
        "hrsh7th/nvim-cmp",
        enable = false, -- TODO
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local cmp_format = require("lsp-zero").cmp_format()

            require("luasnip/loaders/from_vscode").lazy_load()

            cmp.setup({
                formatting = cmp_format,
                completion = { completeopt = "menu,menuone,preview,noselect"},
                -- configure how nvim-cmp interacts with the snippet engine
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                },
                -- source for autocompletion
                sources = {
                    -- snippet
                    { name = "luasnip" },
                    -- text within current buffer
                    { name = "buffer" },
                    -- file system paths
                    { name = "path" },
                },
            })
        end,
    },
    -- https://github.com/github/copilot.vim
    -- GitHub Copilot suggest code and entire functions in real-time right from your editor.
    {
        "github/copilot.vim",
    }
}
