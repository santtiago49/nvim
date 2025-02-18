require('lualine').setup({
    options = {
        theme = 'gruvbox',  -- You can change this to any theme (auto, catppuccin, etc.)
        section_separators = { left = "", right = "" },  -- Rounded separators
        component_separators = { left = "", right = "" },
        globalstatus = true, -- Single statusline for all windows
    },
    sections = {
        lualine_a = { { "mode", fmt = function(str) return " " .. str end } },  -- Show mode with icon
        lualine_b = { "branch", "diff" },  -- Git info
        lualine_c = { 
            { "filename", path = 1 },  -- Show full file path
            { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", hint = " " } }
        },
        lualine_x = { "encoding", "fileformat", "filetype" }, -- File info
        lualine_y = { "progress" },  -- Show cursor progress
        lualine_z = { "location" },  -- Show cursor position
    },
    extensions = { "quickfix", "fugitive", "nvim-tree", "toggleterm" },  -- Auto-detect these plugins
})
