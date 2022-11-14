local function min_window_width(width)
  return function() return vim.fn.winwidth(0) > width end
end

require('lualine').setup{
  options = {
    theme = require('custom').theme(),
  },
  sections = {
    lualine_a = {
      {'mode', cond = min_window_width(40) }
    },
    lualine_b = {
      {'branch', cond = min_window_width(120) }
    }
  }
}

vim.opt.laststatus=3
