-- https://github.com/folke/zen-mode.nvim
-- Distraction-free coding for Neovim
return {
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
}
