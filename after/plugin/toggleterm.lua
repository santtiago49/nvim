local Terminal = require("toggleterm.terminal").Terminal

-- Create a global terminal instance
_G.global_term = _G.global_term or Terminal:new({ direction = "horizontal", hidden = true })

-- Function to toggle or close the terminal
function _toggle_horizontal_term()
    if _G.global_term:is_open() then
        _G.global_term:close()
    else
        _G.global_term:toggle()
    end
end

-- Keybindings
vim.api.nvim_set_keymap("n", "<C-\\>", "<cmd>lua _toggle_horizontal_term()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-\\>", "<cmd>lua _toggle_horizontal_term()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
