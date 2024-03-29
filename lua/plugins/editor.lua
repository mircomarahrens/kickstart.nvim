return {
    {
        -- https://github.com/nvim-telescope/telescope.nvim
        -- telescope.nvim is a highly extendable fuzzy finder over lists.
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
            "nvim-tree/nvim-web-devicons",
            "debugloop/telescope-undo.nvim",
            "aaronhallaert/advanced-git-search.nvim",
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("fzf")

            local actions = require("telescope.actions")

            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    }
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true
                    },
                }
            })

            -- set keymaps
            local keymap = vim.keymap -- for conciseness
            local builtin = require("telescope.builtin")

            keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find [R]ecent [F]iles" })
            keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]tring in current working directory" })
            keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind string under [C]ursor in current working directory" })
            keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
            keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })

            vim.g.zoxide_use_select = true
            telescope.load_extension("undo")
            telescope.load_extension("advanced_git_search")
            telescope.load_extension("live_grep_args")
            telescope.load_extension("noice")

            -- file browser
            telescope.load_extension("file_browser")

            local filebrowser = require("telescope").extensions.file_browser

            vim.keymap.set("n", "<leader>fb", filebrowser.file_browser, { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader><leader>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
        end
    },
    {
        -- https://github.com/nvim-telescope/telescope.nvim
        -- file browser
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        -- https://github.com/christoomey/vim-tmux-navigator
        -- Seamless navigation between tmux panes and vim splits
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        -- https://github.com/ray-x/navigator.lua
        -- Navigate between LSP symbols and files
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
    }
}

