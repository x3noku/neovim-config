vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Cursor
vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 4 -- cursor margin
vim.opt.mouse = 'a' -- allow mouse
vim.opt.virtualedit = 'block' -- allow cursor to move where there is no text in visual block mode

-- Enumeration
vim.wo.number = true -- enumeration
vim.wo.relativenumber = true -- relative enumeration
vim.wo.signcolumn = 'yes' -- extra space for diagnostic symbols

-- Folding
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = { eob = ' ', fold = ' ', foldopen = '', foldsep = ' ', foldclose = '' }

-- Wrapping
vim.wo.wrap = true -- soft wrap text
vim.wo.linebreak = true -- break by special symbols
vim.wo.list = false -- hide trailing blank symbols
vim.opt.breakindent = true -- save indent when wrapping line
-- vim.opt.showbreak = '\\ ' -- virual symbols to show before wrapped line

-- History
vim.opt.undofile = true
vim.opt.updatetime = 250

-- Search
-- vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Completion
vim.opt.timeoutlen = 300
vim.opt.completeopt = { 'menuone', 'noselect' }

-- UI
vim.opt.colorcolumn = '120' -- visual stop column width
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.pumblend = 10 -- opacity for popups
vim.opt.pumheight = 16 -- number of entries in a popup
vim.opt.splitright = true -- put new windows right of current
