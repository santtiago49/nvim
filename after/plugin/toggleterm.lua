local toggleterm = require("toggleterm")

toggleterm.setup({
    size = 15,                -- Height of horizontal terminal
    open_mapping = [[<C-\>]], -- Shortcut to toggle terminal
    direction = "horizontal", -- Open terminal in horizontal split
    shade_terminals = true,
    persist_size = true,
    start_in_insert = true,
    close_on_exit = true,
    shell = vim.o.shell,
})

-- Function to toggle horizontal terminal
function _toggle_horizontal_term()
    vim.cmd("ToggleTerm direction=horizontal")
end

vim.api.nvim_set_keymap("n", "<C-\\>", "<cmd>lua _toggle_horizontal_term()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
