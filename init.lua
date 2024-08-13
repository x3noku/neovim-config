local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'custom.config.options'
require('lazy').setup({
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',
  { import = 'custom.plugins.ui' },
  { import = 'custom.plugins.lang' },
  { import = 'custom.plugins.lsp' },
  { import = 'custom.plugins.editor' },
  { import = 'custom.plugins.other' },
}, {})
require 'custom.config.keymaps'
require 'custom.config.autocmds'
