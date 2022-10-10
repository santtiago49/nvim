local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }



map("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
map("n" , "<C-space>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

map("n" , "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
map("n" , "<C-t>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
map("n" , "<C-n>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
map("n" , "<C-s>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
