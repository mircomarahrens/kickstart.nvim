-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- shortcuts
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- linenumbers
vim.wo.relativenumber = true
vim.wo.number = true


vim.highlight.NonText = {cterm = 'none', ctermfg = '0',guifg = '#073642'}

