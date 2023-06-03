local cmp = require('cmp')
local lspkind = require('lspkind')

return {
    snippet = {
        -- expand = function(args)
        --     fn['UltiSnips#Anon'](args.body)
        -- end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<C-k>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<TAB>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Esc>'] = cmp.mapping.close(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    sources = {
        { name = 'nvim_lsp' },
        -- { name = 'ultisnips' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 2 },
        { name = 'emoji', insert = true },
    },
    completion = {
        keyword_length = 1,
        completeopt = 'menu,noselect',
    },
    view = {
        entries = 'custom',
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = {
                nvim_lsp = '[LSP]',
                ultisnips = '[US]',
                nvim_lua = '[Lua]',
                path = '[Path]',
                buffer = '[Buffer]',
                emoji = '[Emoji]',
                omni = '[Omni]',
            },
        }),
    },
}
