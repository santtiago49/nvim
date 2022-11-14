local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          -- ["<tab>"] = false,
          -- ["<s-tab>"] = false,
          ["<C-h>"] = "move_selection_next",
          ["<C-t>"] = "move_selection_previous",
          ["<Tab>"] = fb_actions.goto_parent_dir,
          -- ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
          -- ["<A-m>"] = actions.select_all
        }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- hhth
          -- your custom insert mode mappings
          ["<C-h>"] = "move_selection_next",
          ["<C-t>"] = "move_selection_previous",
          ["<Tab>"] = fb_actions.goto_parent_dir,
          -- ["<Tab>"] = fb_actions.,
          ["<A-m>"] = fb_actions.move
        },
        ["n"] = {
          -- ["<A-m>"] = fb_actions.move
          -- ["<A-c>"] = fb_actions.create_from_prompt
          -- ["<C-c>"] = "create",
          -- your custom normal mode mappings
        },
      },
    }
  }
}
require("telescope").load_extension "file_browser"
