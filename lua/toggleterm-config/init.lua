local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local map = vim.api.nvim_set_keymap

require("toggleterm").setup{
  size = 10,
  open_mapping = [[<c-\>]],
  persist_size = true
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-s>', [[<Cmd>wincmd l<CR>]], opts)
end

-- move between windows
-- map("t", "<C-h>", [[<C-\><C-n>:wincmd h<CR>]], opts)
-- map("t", "<C-s>", [[<C-\><C-n>:wincmd l<CR>]], opts)



-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
