return {
    {
        "tpope/vim-fugitive", -- Git commands in nvim
    },
    {
        "tpope/vim-rhubarb", -- Fugitive-companion to interact with github
    },
    {
        'tpope/vim-commentary', -- "gc" to comment visual regions/lines
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()

            vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
            vim.keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>")

        end
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",

            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration

        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
