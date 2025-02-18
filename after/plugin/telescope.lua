local actions = require("telescope.actions")
local telescope = require("telescope")

-- 🔥 Optimize Telescope Defaults
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close, -- Close Telescope with Esc
            },
            n = {
                ["q"] = actions.close,     -- Close Telescope with 'q'
            },
        },
        file_ignore_patterns = {
            "node_modules/*",
            "postgres/*",
            "dist/*",
            "build/*",
            "coverage/*",
            ".git/*",
            ".cache/*",
            "vendor/*",        -- PHP/Go dependencies
            "target/*",        -- Rust build folder
            "bin/*",           -- Compiled binaries
            "obj/*",           -- C#/C++ object files
            "logs/*",          -- Log files
            "out/*",           -- Common output directory
            ".venv/*",         -- Python virtual environment
            "__pycache__/*"    -- Python cache files
        },
    }
})

local builtin = require('telescope.builtin')

-- 🔎 Find Files (`<leader>pf>`)
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ no_ignore = true })
end, { desc = "Find files (excluding ignored folders)" })

-- 📂 Open Buffers (`<leader>fb>`)
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find open buffers" })

-- 🛠 Git-tracked Files (`<C-p>`)
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find git-tracked files" })

-- 🔍 Grep (`<leader>ps>`)
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > "),
        additional_args = function(args)
            return vim.tbl_flatten({
                args,
                "--glob=!**/plugin/packer_compiled.lua",  -- Exclude specific file
                "--glob=!**/{node_modules,dist,coverage,postgres}/*" -- Ignore common large folders
            })
        end
    })
end, { desc = "Live Grep with file exclusions" })


-- Find LSP references
vim.keymap.set('n', '<leader>fr', function()
    builtin.lsp_references({
        show_line = true,
        fname_width = 50,
    })
end, { desc = "Find LSP references" })
