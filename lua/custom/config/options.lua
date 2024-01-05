vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Cursor
vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 4 -- cursor margin
vim.o.mouse = 'a'

-- Enumeration
vim.wo.number = true -- enumeration
vim.wo.relativenumber = true -- relative enumeration
vim.wo.signcolumn = 'yes' -- extra space for diagnostic symbols

-- Folding
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'

-- Wrapping
vim.wo.wrap = true -- soft wrap text
vim.wo.linebreak = true -- break by special symbols
vim.wo.list = false -- hide trailing blank symbols
vim.o.breakindent = true -- save indent when wrapping line
-- vim.opt.showbreak = '\\ ' -- virual symbols to show before wrapped line

-- History
vim.o.undofile = true
vim.o.updatetime = 250

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Completion
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'

-- UI
vim.o.termguicolors = true
vim.opt.colorcolumn = '120' -- visual stop column width
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.pumblend = 10 -- opacity for popups
vim.opt.pumheight = 16 -- number of entries in a popup
