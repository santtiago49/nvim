require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<tab>"] = false,
          ["<s-tab>"] = false,
          ["<C-h>"] = "move_selection_next",
          ["<C-t>"] = "move_selection_previous"
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
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    file_browser = {
      cwd_to_path = true
    }
    -- please take a look at the readme of the extension you want to configure
  }
}
require("telescope").load_extension "file_browser"
