-- https://github.com/folke/zen-mode.nvim
-- Distraction-free coding for Neovim
return {
    "folke/zen-mode.nvim",
    config = function()
        local zen = require("zen-mode")
        -- zen-mode
        vim.keymap.set("n", "<leader>zz", function()
            zen.setup {
                window = {
                    width = 90,
                    options = { }
                },
            }
            zen.toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
        end,
        { noremap = true })
    end
}
