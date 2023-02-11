-- colors
opt.syntax = 'enable' -- syntax highlighting
opt.termguicolors = true -- true color support
opt.colorcolumn = '120' -- visual stop column width
set_theme(read_theme()) -- set color theme


-- cursor
opt.cursorline = true -- highlight current line
opt.so = 5 -- cursor margin
cmd [[set nostartofline]] -- don't miss cursor position on move


-- enumeration
opt.number = true -- enumeration
opt.relativenumber = true -- relative enumeration
opt.ruler = true -- scroll percantage
opt.signcolumn = 'yes' -- extra space for diagnostic symbols


-- wrapping
wo.wrap = true -- wrap text
wo.linebreak = true -- soft wrap text
wo.list = false  -- hide special symbols


-- other
opt.encoding = 'UTF-8' -- encoding
cmd [[set noshowmode]] -- disable standart mode display
cmd [[set clipboard=unnamedplus]] -- system clipboard


-- autocomplete
require('mason').setup(require('configs.mason'))
require('mason-lspconfig').setup(require('configs.mason-lspconfig'))
require('cmp').setup(require('configs.cmp'))
require('configs.lspconfig')
require('null-ls').setup(require('configs.null-ls'))


-- git
require('gitsigns').setup()
require('gitsigns').setup(require('configs.gitsigns'))


-- ui extensions
require('neoscroll').setup()
require('dressing').setup(require('configs.dressing'))
require('nvim-treesitter.configs').setup(require('configs.nvim-treesitter'))
require('todo-comments').setup(require('configs.todo-comments'))


-- ui blocks
require('bufferline').setup(require('configs.bufferline'))
require('lualine').setup(require('configs.lualine'))
require('which-key').setup(require('configs.which-key'))
require('trouble').setup(require('configs.trouble'))
require('neo-tree').setup(require('configs.neo-tree'))


-- utils
require('nvim-autopairs').setup()
require('Comment').setup(require('configs.Comment'))
require('presence').setup(require('configs.presence'))


-- todo: latex config
-- g.tex_flavor='latex'
-- g.vimtex_view_method='zathura'
-- g.vimtex_compiler_method = 'latexrun'
-- g.vimtex_compiler_latexrun = { build_dir = 'build' }
-- g.vimtex_indent_enabled = true
-- g.vimtex_syntax_enabled = true
-- g.vimtex_quickfix_mode = false
-- g.tex_conceal='abdmg'
-- cmd 'set conceallevel=1'
