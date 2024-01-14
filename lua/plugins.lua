return {
    -- lua package: https://github.com/nvim-lua/plenary.nvim
    {
        'nvim-lua/plenary.nvim'
    },

    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- telescope
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
            vim.keymap.set("n", '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
            vim.keymap.set("n", '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end
            , { desc = '' })
        end
    },

    -- trouble.nvim is a pretty diagnostics, references, telescope results, quickfix and location list viewer
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- file browser
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            -- file-browser
            local filebrowser = require("telescope").extensions.file_browser
            vim.keymap.set("n", "<leader>fb", filebrowser.file_browser, { noremap = true })
            -- vim.keymap.set("n", "<leader>fb", function() filebrowser.file_browser() end, { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader><leader>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
        end
    },

    -- Distraction-free coding for Neovim
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            -- zen-mode
            vim.keymap.set("n", "<leader>zz", function()
                require("zen-mode").setup {
                    window = {
                        width = 90,
                        options = { }
                    },
                }
                require("zen-mode").toggle()
                vim.wo.wrap = false
                vim.wo.number = true
                vim.wo.rnu = true
            end)
        end
    },

    -- GitHub Copilot uses OpenAI Codex to suggest code and entire functions in real-time right from your editor.
    {
        'github/copilot.vim'
    },

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
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
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
    {
        'mbbill/undotree',
        config = function()
            -- undotree
            vim.keymap.set("n", '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndo Tree' })
        end
    },

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
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- colorscheme
            vim.cmd('colorscheme tokyonight-moon')
        end
    },

    -- file explorer
    {
        'ThePrimeagen/harpoon',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>hc", mark.clear_all)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

        end
    },

    {
        'rust-lang/rust.vim'
    },

    {
        'tpope/vim-fugitive',
        config = function()
            -- fugitive
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = 'Git [S]tatus' })
        end
    },

    -- lsp-zero
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local lsp_zero = require('lsp-zero')
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'cmake',
                    'pylsp',
                    'tsserver',
                    'rust_analyzer'},
                    handlers = {
                        lsp_zero.default_setup,
                        lua_ls = function()
                            local lua_opts = lsp_zero.nvim_lua_ls()
                            require('lspconfig').lua_ls.setup(lua_opts)
                        end,
                    }
                })

                local cmp = require('cmp')
                local cmp_select = {behavior = cmp.SelectBehavior.Select}

                cmp.setup({
                    sources = {
                        {name = 'path'},
                        {name = 'nvim_lsp'},
                        {name = 'nvim_lua'},
                    },
                    formatting = lsp_zero.cmp_format(),
                    mapping = cmp.mapping.preset.insert({
                        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                        ['<C-Space>'] = cmp.mapping.complete(),
                    }),
                })
            end
        },

        {
            'neovim/nvim-lspconfig'
        },
        {
            'hrsh7th/cmp-nvim-lsp'
        },
        {
            'hrsh7th/nvim-cmp'
        },
        {
            'L3MON4D3/LuaSnip'
        },
    }
