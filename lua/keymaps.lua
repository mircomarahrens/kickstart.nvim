-- other keymaps
vim.keymap.set('n', '<leader>ex', vim.cmd.Ex, { noremap = true }) -- back to netrw
vim.keymap.set('n', '<leader>tb', ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', { noremap = true, silent = true}) -- toggle background

