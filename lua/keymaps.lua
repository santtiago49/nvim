local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- Leader key


-- basic settings
map("n", "U", ":redo<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
-- map("n", "U", ":redo<CR>", opts)
-- map("i", "", "<esc>ciw", opts)



-- Dvorak mapping ------------------------------

-- normal mode 
map('n', 'm', 'n', opts)
map('n', 'M', 'N', opts)

map("n", "h", "<Down>", {}) -- Down
map("n", "t", "<Up>", {}) -- Up
map("n", "n", "<Left>", {}) -- Left
map("n", "s", "<Right>", {}) -- Right

--map("n", 
map("n", "<F1>", "", {})

-- visual mode
-- map("v", "f", "t", opts) -- Down
map("v", "H", "<Down>", {}) -- Down
map("v", "T", "<Up>", {}) -- Up
-- map("v", "h", "<Down>", {}) -- Down
-- map("v", "t", "<Up>", {}) -- Up
map("v", "s", "<Right>", {}) -- Up
map("v", "n", "<Left>", {}) -- Up
map("v", "N", "$", {}) -- end
map("v", "S", "g_", {}) -- end

map("n", "H", "v<down>", opts)
map("n", "T", "v<up>", opts)

-- insert mode
map("i", "<c-h>", "<esc>5<down>", opts)
map("i", "<c-t>", "<esc>5<up>", opts)

-- jump lines
-- map("n", "<C-h>", "5<Down>", {})
-- map("n", "<C-t>", "5<Up>", {})
-- map("v", "<C-h>", "10<Down>", {})
-- map("v", "<C-t>", "10<Up>", {})

--map("i", "hh", "", opts)

-- move lines
map("n", "<M-h>", ":m .+1<CR>==", opts)
map("n", "<M-t>", ":m .-2<CR>==", opts)
map("v", "<M-h>", ":m '>+1<CR>gv=gv", opts)
map("v", "<M-t>", ":m '<-2<CR>gv=gv", opts)

map("n", "", ":qa!<CR>", opts)


-- Move between windows --
-- map("n", "<leader>t", "<C-w>k", opts)
-- map("n", "<leader>h", "<C-w>j", opts)
map('n', '<leader>h', [[<Cmd>wincmd h<CR>]], opts)
map('n', '<leader>s', [[<Cmd>wincmd l<CR>]], opts)

-- Tree directories --
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts) -- Shift + t
map("n", "<C-f>", ":NvimTreeFocus<CR>", opts) -- Shift + f

-- Bufferline --
-- Move to previous/next
-- map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts) -- Shift + left arrow
-- map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts) -- Shift + right arrow

-- close buffer
map("n", "", ":Bdelete<CR>", opts)

-- Telescope --
-- map("n", "<leader>ff", "<cmd>lua require('telescope').extensions.file_browser.file_browser({ path = "%:p:h" })", opts)
map("n", "<leader>FF", '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", hidden=true, layout_config={prompt_position="top"} })<cr>', opts)
map("n", "<leader>fg", ':Telescope find_files<CR>', opts)
map("n", "<leader>ff", ':Telescope git_files<CR>', opts)
-- map("n", "<leader>ff", ':FZF<cr>', opts)
-- map("n", "<leader>fb", '<cmd>lua require("telescope").extensions.file_browser.folder_browser()<cr>', opts)
-- map("n", "<leader>fg", ":Telescope git_files<CR>", opts)
-- map("n", "<leader>fl", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

function _G.config_files()
  require('telescope.builtin').find_files( { cwd = '~/.config/nvim' })
end

map("n", "<F5>", ':lua config_files()<CR>', opts)
map("n", "<F4>", ':e ~/.tmux.conf<CR>', opts)



-- ToggleTerm

-- map("n", "<C-Bslash>", ":ToggleTerm<CR>", opts)
map("n", "<C-l>", [[:ToggleTermToggleAll<CR>]], opts)
map("t", "<C-l>", [[<C-\><C-n>:ToggleTermToggleAll!<CR>]], opts)
-- map("t", "<C-shift-l>", [[<C-\><C-n>:q<CR>]], opts)
map("t", "<C-w>", [[<C-\><C-n>:bd!<CR>i]], opts)
map("t", "<esc>", [[<C-\><C-n>]], opts)


-- Greatest remap ever
-- map("v", "<leader>p", "\"_dP", opts)
-- map("v", "<leader>p", [[<c-r>"]], opts)

-- Toggling all terminals
map("n", "<c-l>", [[:ToggleTermToggleAll<CR>]], opts)
-- map("n", "<m-l>", [[<Cmd>exe v:count1 . "ToggleTerm"<CR>]], opts)

-- creating terminal by number
map("n", "1<c-l>", [[<C-\><C-n>:1ToggleTerm<CR>]], opts)
map("n", "2<c-l>", [[<C-\><C-n>:2ToggleTerm<CR>]], opts)
map("n", "3<c-l>", [[<C-\><C-n>:3ToggleTerm<CR>]], opts)


vim.keymap.set('n', '<C-r>', ':Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('i', '<C-k>', '<cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gp', '<cmd>Lspsaga preview_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<cr>', opts)

-- remap copy paste
vim.keymap.set('n', 'x', '"_x', opts)
-- vim.keymap.set('n', 'dd', '"_dd', opts)
-- vim.keymap.set('n', 'dw', '"_dw', opts)
vim.keymap.set('n', 'ciw', '"_ciw', opts)
-- vim.keymap.set('i', '<leader>p', '<esc>p', opts)


map("n", "<F6>", ":e ~/todo.txt<cr>", opts)
