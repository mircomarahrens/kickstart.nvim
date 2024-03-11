-- https://github.com/tpope/vim-fugitive
-- git plugin for vim
return {
    "tpope/vim-fugitive",
--[[    config = function()
        local git = require("vim-fugitive")

        git.setup({
            keymaps = {
                n = {
                    ["<leader>gs"] = "Git",
                    ["<leader>ga"] = "Gwrite",
                    ["<leader>gc"] = "Gcommit",
                    ["<leader>gp"] = "Gpush",
                    ["<leader>gl"] = "Gpull",
                    ["<leader>gb"] = "Gblame",
                    ["<leader>gd"] = "Gdiff",
                }
            }
        })
    end
--]]
}
