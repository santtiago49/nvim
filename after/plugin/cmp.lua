-- cmp.lua
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Enhanced method detection
local function is_method(entry)
  local ok, kinds = pcall(function()
    return entry:get_completion_item().kind
  end)
  if not ok then return false end

  -- LSP kind numbers: 2 = Method, 3 = Function, 6 = Constructor
  return vim.tbl_contains({ 2, 3 }, kinds)
end

-- Parentheses insertion callback
local add_parentheses = function(entry)
  if not is_method(entry) then return end
  
  vim.schedule(function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local char_before = line:sub(col, col)
    
    -- Only add parentheses if not already present
    if char_before ~= '(' then
      vim.api.nvim_input('()')
      vim.api.nvim_input('<Left>')
    end
  end)
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace
        })
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = function(entry, vim_item)
      if is_method(entry) then
        vim_item.abbr = vim_item.abbr .. '()'
      end
      return vim_item
    end
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
  end
})

-- Handle parentheses insertion after confirmation
cmp.event:on('confirm_done', function(event)
  if event.entry then
    add_parentheses(event.entry)
  end
end)

-- SQL-specific completion
cmp.setup.filetype({ 'sql' }, {
  sources = {
    { name = 'vim-dadbod-completion' },
    { name = 'buffer' },
  }
})
