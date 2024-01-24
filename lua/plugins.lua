return {
    -- https://github.com/nvim-telescope/telescope.nvim
    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local telescope = require("telescope")

            telescope.load_extension("fzf")

            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
            })

            -- set keymaps
            local keymap = vim.keymap -- for conciseness
            local builtin = require("telescope.builtin")

            keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find [R]ecent [F]iles" })
            keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]tring in current working directory" })
            keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind string under [C]ursor in current working directory" })
            keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
            keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        end
    },

    -- https://github.com/nvim-telescope/telescope.nvim
    -- file browser
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            local filebrowser = require("telescope").extensions.file_browser
            vim.keymap.set("n", "<leader>fb", filebrowser.file_browser, { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader><leader>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
        end
    },

    -- https://github.com/mbbill/undotree
    -- Undotree visualizes the undo history
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndo Tree" })
        end
    },

    -- https://github.com/folke/which-key.nvim 
    -- popup menu for possible keybindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 299
        end,
    },

    -- https://github.com/folke/trouble.nvim
    -- trouble.nvim is a pretty diagnostics, references, telescope results, quickfix and location list viewer
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- TODO recheck bindings
            vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
            vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
            vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
            vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
            vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
        end
    },

    -- https://github.com/folke/zen-mode.nvim
    -- Distraction-free coding for Neovim
    {
        "folke/zen-mode.nvim",
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

    -- https://github.com/github/copilot.vim
    -- GitHub Copilot suggest code and entire functions in real-time right from your editor.
    {
        "github/copilot.vim"
    },

    -- https://github.com/nvim-treesitter/nvim-treesitter
    -- Tree-sitter is a parser generator tool and an incremental parsing library.
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            -- A list of parser names, or "all" (the five listed parsers should always be installed) 
            ensure_installed = {
                "bash",
                "lua",
                "c",
                "cpp",
                "cmake",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "vim",
                "toml",
                "yaml",
                "json",
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = false,

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        },
        run = ":TSUpdate"
    },

    -- https://github.com/folke/tokyonight.nvim
    -- colorschemes
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd("colorscheme tokyonight-moon")
        end
    },

    -- https://github.com/ThePrimeagen/harpoon
    -- quick navigation between locations
    {
        "ThePrimeagen/harpoon",
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

    -- https://github.com/VonHeikemen/lsp-zero.nvim
    -- Collection of functions that will help you setup Neovim's LSP client, so you can get IDE-like features with minimum effort.
    {
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

    -- https://github.com/williamboman/mason.nvim
    -- Mason is a plugin for Neovim that provides a simple way to manage your projects.
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
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
                    "pylsp",
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
        end
    },

    -- https://github.com/hrsh7th/nvim-cmp
    -- nvim-cmp source for neovim builtin LSP client
    {
        "hrsh7th/nvim-cmp",
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


    --[[
    {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
    local lsp_zero = require("lsp-zero")
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
    --]]

    --[[
    -- https://github.com/williamboman/mason.nvim
    -- Mason is a plugin for Neovim that provides a simple way to manage your projects.
    {
    "williamboman/mason.nvim",
    config = function()
    require("mason").setup({})
    end
    },

    -- https://github.com/williamboman/mason-lspconfig.nvim
    -- mason-lspconfig bridges mason.nvim with the lspconfig plugin
    {
    "williamboman/mason-lspconfig.nvim",
    config = function()
    require("mason-lspconfig").setup({
    ensure_installed = {
    "clangd",
    "cmake",
    "pylsp",
    "rust_analyzer"
    },
    })
    end
    },

    -- https://github.com/neovim/nvim-lspconfig
    -- Collection of configurations for built-in LSP client
    {
    "neovim/nvim-lspconfig",
    config = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
    settings = {
    Lua = {
    diagnostics = {
    -- Get the language server to recognize the `vim` global
    globals = {'vim'},
    },
    },
    },
    })
    lspconfig.clangd.setup({})
    lspconfig.cmake.setup({})
    lspconfig.pylsp.setup({})
    lspconfig.rust_analyzer.setup({})
    end
    },

    -- https://github.com/hrsh7th/nvim-cmp
    -- nvim-cmp source for neovim builtin LSP client
    {
    "hrsh7th/nvim-cmp",
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

    require("luasnip/loaders/from_vscode").lazy_load()

    cmp.setup({
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
    --]]

    {
        "rust-lang/rust.vim"
    },

    -- https://github.com/tpope/vim-fugitive
    -- git plugin for vim
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git [S]tatus" })
            vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite, { desc = "Git [A]dd" })
            vim.keymap.set("n", "<leader>gc", vim.cmd.Gcommit, { desc = "Git [C]ommit" })
            vim.keymap.set("n", "<leader>gp", vim.cmd.Gpush, { desc = "Git [P]ush" })
            vim.keymap.set("n", "<leader>gl", vim.cmd.Gpull, { desc = "Git [P]ull" })
            vim.keymap.set("n", "<leader>gb", vim.cmd.Gblame, { desc = "Git [B]lame" })
            vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff, { desc = "Git [D]iff" })
            -- TODO
        end
    },

    -- https://github.com/nvim-lualine/lualine.nvim
    -- A blazing fast and easy to configure neovim statusline written in pure lua.
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    theme = "tokyonight"
                }
            }
        end
    },
}
