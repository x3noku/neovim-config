g.mapleader = '/' -- leader key


-- navigation bindings
map('i', 'jj', '<ESC>', {})
map('', '<left>', ':echoe "Use h"<CR>', {})
map('', '<down>', ':echoe "Use j"<CR>', {})
map('', '<up>', ':echoe "Use k"<CR>', {})
map('', '<right>', ':echoe "Use l"<CR>', {})
map('', '<C-j>', 'gj', {})
map('', '<C-k>', 'gk', {})


-- tree and buffers
map('n', '<C-n>', function () cmd [[NeoTreeFocusToggle]]  end, {})
map('n', '<S-h>', function () cmd [[BufferLineCyclePrev]] end, {})
map('n', '<S-l>', function () cmd [[BufferLineCycleNext]] end, {})
map('n', '{', function () cmd [[BufferLineMovePrev]] end, {})
map('n', '}', function () cmd [[BufferLineMoveNext]] end, {})
map('n', '<S-b>', function () cmd [[Bdelete]] end, {})


-- git
map('n', 'gz', function () cmd [[LazyGit]] end, {})
map('n', 'ge', function () cmd [[Gitsigns toggle_deleted]] end, {})
map('n', 'gs', function () cmd [[Gitsigns toggle_linehl]] end, {})


-- terminal
map('i', '<C-x>', function () cmd [[stopinsert]] cmd [[FloatermToggle]] cmd [[normal i]] end, {})
map('n', '<C-x>', function () cmd [[FloatermToggle]] end, {})
map('t', '<C-x>', function () cmd [[FloatermToggle]] end, {})
map('t', '<C-n>', function () cmd [[FloatermNew]] end, {})
map('t', '<C-h>', function () cmd [[FloatermPrev]] end, {})
map('t', '<C-l>', function () cmd [[FloatermNext]] end, {})
map('t', '<C-b>', function () cmd [[FloatermKill]] cmd [[FloatermShow]] end, {})


-- autocomplete
map('n', 'gd', function () lsp.buf.definition() end, {})
map('n', 'gi', function () lsp.buf.implementation() end, {})
map('n', 'gr', function () lsp.buf.references() end, {})
map('n', 'gt', function () lsp.buf.code_action() end, {})

map('n', '<Leader>rn', function () lsp.buf.rename() end, {})
map('n', 'K', function () lsp.buf.hover() end, {})


-- todo: C-h go left
-- todo: C-l go right
-- todo: add binding for quick exit
-- todo: resolev how to q with buffer closing
-- todo: add binding for trouble list
-- todo: add bindig for diagnostig jump on ]d [d
-- todo: add bindings for auto commas etc
-- todo: add binding to clear selection
-- todo: add bindings to move buffers


-- finder
map('n', 'ff', telescope.find_files, {})
map('n', 'ft', function () cmd [[TodoTelescope keywords=TODO,ToDo,todo,FIXME,FixMe,fixme,WARN,Warn,warn,WARNING,Warning,warning]] end, {})


-- color themes
map('n', '<C-t>', function () cmd [[WhichKey t]] end, { desc = 'Choose theme' })
