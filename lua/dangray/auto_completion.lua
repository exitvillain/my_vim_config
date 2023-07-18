local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `LuaSnip` user.
            require'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})


require('nvim-autopairs').setup({})
