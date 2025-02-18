-- ~/.config/nvim/after/plugin/color.lua

-- Define the function
local function ColorMyPencils(color)
  color = color or "gruvbox"  -- default to gruvbox if no color specified
  vim.cmd.colorscheme(color)

  -- Set transparent background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Set up autocommand to run on Neovim startup
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Add a small delay to ensure colorscheme plugins are loaded
    vim.defer_fn(function()
      ColorMyPencils("gruvbox")  -- explicitly specify your colorscheme here
    end, 50)
  end
})
