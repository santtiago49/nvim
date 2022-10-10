-- Set up nvim-cmp.
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
-- local select_opts = {behavior = cmp.SelectBehavior.Select}

  -- cmp.event:on(
  --  'confirm_done'
  -- cmp_autopairs.on_confirm_done()
  -- )
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

  cmp.setup({
  snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ["<C-h>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<C-t>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,

    -- ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Esc>"] = cmp.mapping.close(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
     -- },     -- ['<tab>'] = cmp.mapping.confirm({ select = true }),
    },
    -- mapping = {
     --  -- ['<Tab>'] = cmp.mapping(function(fallback)
     --  --       if cmp.visible() then
     --  --         -- cmp.select_next_item()
     --  --         cmp.mapping.confirm({select = true})
     --  --       else
     --  --         fallback()
     --  --       end
     --  --     end),
     -- ['<C-t>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
     -- ['<C-h>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
     -- ['<C-Space>'] = cmp.mapping.complete(),
    -- formatting = {
    --     format = function(entry, item)
    --         -- item.kind = lsp_symbols[item.kind]
    --         item.menu = ({
    --           nvim_lsp = "[LSP]",
    --           luasnip = "[Snippet]",
    --         })[entry.source.name]
    --
    --         return item
    --     end,
    -- },
    sources = cmp.config.sources({
       { name = 'nvim_lsp' },
       { name = 'luasnip' }, -- For vsnip users.
       { name = 'buffer' },
     })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
    --   { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    -- }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

