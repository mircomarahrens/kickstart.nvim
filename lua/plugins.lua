return {
    -- lua package: https://github.com/nvim-lua/plenary.nvim
    {'nvim-lua/plenary.nvim'},

    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- file browser
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    -- GitHub Copilot uses OpenAI Codex to suggest code and entire functions in real-time right from your editor.
    {'github/copilot.vim'},

    -- Tree-sitter is a parser generator tool and an incremental parsing library.
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            -- A list of parser names, or "all" (the five listed parsers should always be installed) 
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "toml",
                "yaml",
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        },
        run = ':TSUpdate'
    },

    -- undotree
    {'mbbill/undotree'},

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 299
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- themes
    {'rose-pine/neovim', name = 'rose-pine'},
    {'rebelot/kanagawa.nvim'},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- file explorer
    {'ThePrimeagen/harpoon'},
    {'rust-lang/rust.vim'},
    {'tpope/vim-fugitive'},

    -- lsp-zero
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    -- Distraction-free coding for Neovim
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
}
