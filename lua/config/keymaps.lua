-- tmux window navigation
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { noremap = true })

-- replace currently selected text with default register without yanking it
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true })

vim.api.nvim_set_keymap("i", "<C-w>", "<C-><C-o>dB", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-><C-o>dB", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true })

-- indent and un-indent in normal mode
vim.api.nvim_set_keymap("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true })

-- indent and un-indent in visual mode
vim.api.nvim_set_keymap("x", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<S-Tab>", "<gv", { noremap = true, silent = true })
