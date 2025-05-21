vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Icons
vim.g.iconset = 'nvim-web-devicons' -- `mini.icons` or `nvim-web-devicons`
vim.g.wk_theme_lines = 4 -- height of whick-key theme pane

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
vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

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
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.pumblend = 10 -- opacity for popups
vim.opt.pumheight = 16 -- number of entries in a popup
vim.opt.splitright = true -- put new windows right of current

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
--
-- See config.autocmds.lua
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB
