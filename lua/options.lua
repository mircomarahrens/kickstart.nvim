-- linenumbers
vim.wo.relativenumber = true
vim.wo.number = true

-- highlight
vim.highlight.NonText = {cterm = 'none', ctermfg = '0',guifg = '#073642'}

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true


vim.opt.linebreak = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.showbreak = '↪'

-- vim.opt.colorcolumn = '80'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }
-- listchars
-- vim.opt.list = true
-- vim.opt.listchars = { eol = '↵', tab = '>-', trail = '~', extends = '>', precedes = '<', space = '.' }
