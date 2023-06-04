local opt = vim.opt
local o = vim.o

opt.shiftwidth = 4 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.spelllang = { "en" }
opt.tabstop = 4 -- Number of spaces tabs count for
opt.wrap = true -- Disable line wrap

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
