local ok, lspkind = pcall(require, "lspkind")
if not ok then
    return
end

lspkind.init()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local cmp =  require "cmp"

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup {
    mapping = {
                 ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                 ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                 ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                 ['<C-f>'] = cmp.mapping.scroll_docs(4),
                 ['<C-e>'] = cmp.mapping.abort(),
                 ['<C-y>'] = cmp.mapping(
                                cmp.mapping.confirm {
                                    behavior = cmp.ConfirmBehavior.Insert,
                                    select = true,
                                },
                                { "i", "c" }
                              ),

                 ['<C-Space>'] = cmp.mapping {
                                    i = cmp.mapping.complete(),
                                    c = function(
                                        _ --[[fallback]]
                                    )
                                        if cmp.visible() then
                                            if not cmp.confirm { select = true } then
                                                return
                                            end
                                    else
                                        cmp.complete()
                                    end
                                end,
                            },
            },

    sources = cmp.config.sources {

            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'buffer', keyword_length = 6 },
        },

    snippet = {
        expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },

    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            mode = 'symbol',
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snippet]",
            },
        },
    },
}
