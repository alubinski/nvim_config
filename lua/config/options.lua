local opt = vim.opt

-- Tab / Indentation Options --
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search Items --
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Appearance --
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '100'
opt.signcolumn = 'yes'
opt.cmdheight = 0
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Behavior --
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append('a') -- mouse available in all modes
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

-- Commands --

-- Disables warning messages in health checks
vim.cmd[[let g:loaded_ruby_provider = 0]]
vim.cmd[[let g:loaded_perl_provider = 0]]
vim.cmd[[let g:loaded_node_provider = 0]]
vim.deprecate = function() end


vim.opt.pumheight = 10 -- Only show 10 suggestions at a time


































































































