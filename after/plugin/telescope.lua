local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

-- Configure Telescope with Trouble integration
-- telescope.setup({
--   defaults = {
--     mappings = {
--       i = {
--         ["<c-t>"] = trouble.open_with_trouble,  -- Open in Trouble (insert mode)
--         ["<a-t>"] = trouble.add_to_trouble,     -- Add to Trouble (insert mode)
--       },
--       n = {
--         ["<c-t>"] = trouble.open_with_trouble,  -- Open in Trouble (normal mode)
--         ["<a-t>"] = trouble.add_to_trouble,     -- Add to Trouble (normal mode)
--       },
--     },
--   },
-- })

-- Your existing Telescope keymaps with Trouble support
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        -- hidden = true,  -- Include hidden files (e.g., dotfiles)
        no_ignore = true,  -- Include ignored files
        -- no_ignore_parent = true,  -- Include files ignored by parent `.gitignore`
    })
end, { desc = "Find files including hidden and ignored" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > "),
        additional_args = function(args)
            return vim.tbl_flatten({
                args,
                -- "--hidden",           -- Include hidden files
                -- "--no-ignore",        -- Include files ignored by .gitignore
                "--glob=!**/plugin/packer_compiled.lua"  -- Exclude specific file
            })
        end
    })
end, { desc = "Grep string including hidden and ignored files" })

-- Optional: Create dedicated Trouble+Telescope keymaps
-- vim.keymap.set('n', '<leader>pt', function()
--   builtin.find_files({
--     attach_mappings = function(_, map)
--       map('i', '<c-t>', trouble.open_with_trouble)
--       map('n', '<c-t>', trouble.open_with_trouble)
--       return true
--     end
--   })
-- end, { desc = "Find files with Trouble integration" })
