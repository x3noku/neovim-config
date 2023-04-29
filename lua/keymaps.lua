g.mapleader = ' ' -- leader key


-- navigation bindings
map('n', '<C-q>', ':qa<CR>', {})
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
map('n', '<C-s>', ':w<CR>', {})


-- git
map('n', 'gz', function () cmd [[LazyGit]] end, {})
map('n', 'ge', function () cmd [[Gitsigns toggle_deleted]] end, {})
map('n', 'gs', function () cmd [[Gitsigns toggle_linehl]] end, {})
map('n', 'gw', function () cmd [[Gitsigns toggle_word_diff]] end, {})
map('n', 'gh', function () cmd [[Gitsigns toggle_deleted]] cmd [[Gitsigns toggle_linehl]] cmd [[Gitsigns toggle_word_diff]] end, {})


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


-- diagnostics
map('n', ']d', function () diagnostic.goto_next() end, {})
map('n', '[d', function () diagnostic.goto_prev() end, {})
map('n', 'df', function () diagnostic.open_float() end, {})


-- neovide
scale_note= nil
if g.neovide then
    map('i', '<C-S-v>', '<C-r>+', {})
    map('c', '<C-S-v>', '<C-r>+', {})
    map('t', '<C-S-v>', '<C-r>+', {})
    map('n', '<C-=>', increase_neovide_scale, {})
    map('n', '<C-->', decrease_neovide_scale, {})
    map('i', '<C-=>', increase_neovide_scale, {})
    map('i', '<C-->', decrease_neovide_scale, {})
end


-- todo: C-h go left
-- todo: C-l go right
-- todo: add binding for quick exit
-- todo: resolev how to q with buffer closing
-- todo: add binding for trouble list
-- todo: add bindings for auto commas etc
-- todo: add binding to clear selection
-- todo: add bindings to move buffers


-- finder
map('n', 'ff', telescope.find_files, {})
map('n', 'fg', telescope.live_grep, {})
map('n', 'ft', function () cmd [[TodoTrouble keywords=TODO,ToDo,todo,FIXME,FixMe,fixme,WARN,Warn,warn,WARNING,Warning,warning]] end, {})
map('n', 'fc', function () cmd [[nohl]] end, {})


-- color themes
map('n', '<C-t>', function () cmd [[WhichKey t]] end, { desc = 'Choose theme' })
