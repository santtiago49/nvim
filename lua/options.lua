
local set = vim.opt

-- formating
set.expandtab = true -- Tabs to Spaces
-- set.noswapfile = true
set.smarttab = true
set.shiftwidth = 4
set.softtabstop = 4 -- I have a special configuration for each file in ftplugin/
set.tabstop = 4
set.hlsearch = true -- Highlight all matches while searching
set.incsearch = true -- Highlight all matches while searching
set.ignorecase = true -- Ignorecase ins search pattern
set.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters
set.autoindent = true -- Autoindent
set.encoding = "utf-8"
set.list = true
--set.listchars:append("eol:↴")
set.hlsearch = false

-- Backups --
-- set.backup = true -- Enable
-- Backup config
-- set.backupcopy = "yes"
-- set.backupdir = vim.fn.expand(vim.fn.stdpath("data") .. "/backup/")
-- -- Undofiles are truly nice!
-- set.undofile = true
-- set.undodir = vim.fn.expand(vim.fn.stdpath("data") .. "/undo/")
--
-- interface --
set.number = true -- Print the line in front of each line
set.relativenumber = true
set.clipboard = "unnamedplus"
set.splitbelow = true -- Will put the new window below the currentone
set.splitright = true -- Will put the new window right of the current one
set.wrap = false -- Lines longer than the widh window continues on next line
set.scrolloff = 8
set.termguicolors = true -- Enable 24-bits RGB color in TUI
set.cursorline = true -- Highlight the screen line of the cursor with CursorLine
set.hidden = true -- Work with several buffers
set.completeopt = "menu,menuone,noselect" -- Important
set.lazyredraw = true -- Very lazy please
set.emoji = true -- Use Emoji
set.mouse = "a" -- Visually select and copy without line numbers
set.ttyfast = true -- Don't redraw while executing macros
set.background = "dark" -- Dark Background
set.history = 1000 -- Bigger history
set.matchpairs = "(:),{:},[:],<:>,':'" -- Add chars to '%'
set.ruler = false
-- set.signcolumn = "yes"

-- Theme --
-- vim.g.material_style = "deep ocean"
-- vim.g.material_style = "tokyonight"
-- Lua initialization file


-- vim.cmd [[colorscheme tokyonight]]
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true-- vim.cmd("colorscheme catppuccin")
-- set.highlight = 'Normal ctermbg=none'
-- set.highlight = 'NonText ctermbg=none'


-- Notifications --
-- vim.notify = require("notify")
-- if not vim.notify then
--   print("notify not found")
--   return
--
--
-- end
