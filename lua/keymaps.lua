-- other keymaps
vim.keymap.set('n', '<leader>xx', vim.cmd.Ex, { noremap = true }) -- back to netrw
vim.keymap.set('n', '<leader>tb', ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', { noremap = true, silent = true}) -- toggle background

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true }) -- close window
-- vim.keymap.set('n', '<leader>Q', ':qa<CR>', { noremap = true }) -- close all windows

-- Keybinds for git
-- vim.keymap.set('n', '<leader>gs', ":Git<CR>", { noremap = true }) -- open git status
--                    ["<leader>ga"] = "Gwrite",
--                    ["<leader>gc"] = "Gcommit",
--                    ["<leader>gp"] = "Gpush",
--                    ["<leader>gl"] = "Gpull",
--                    ["<leader>gb"] = "Gblame",
--                    ["<leader>gd"] = "Gdiff",
