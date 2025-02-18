-- LSP Configuration
local lspconfig = require('lspconfig')

-- Setup Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "gopls", "csharp_ls" },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            }
        end,
        -- Your existing special handlers (zls, lua_ls) can stay
    }
})

-- Simplified Diagnostic Setup
vim.diagnostic.config({
    virtual_text = {
        source = "always",
        prefix = "●",
        spacing = 4,
    },
    float = {
        border = "rounded",
        source = "always",
        header = "",
        focusable = false,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Keymaps (simplified and more intuitive)
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        local map = vim.keymap.set

        -- Basic LSP mappings
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- Diagnostic mappings
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        -- map("n", "<leader>d", function() -- trouble plugin doesn't work
        --     require("trouble").toggle("document_diagnostics")
        -- end, { desc = "Toggle diagnostics list" })

        -- Signature help while typing
        map("i", "<C-s>", vim.lsp.buf.signature_help, opts)
    end
})

-- Visual Enhancements
require("lsp-colors").setup({})
require("lspsaga").setup({
    lightbulb = { enable = false },
    diagnostic = {
        show_code_action = false,
        show_source = true,
    },
})

-- Automatic diagnostic focus
-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = function()
--         vim.diagnostic.open_float(nil, { focusable = true })
--     end,
-- })

-- Enable LSP status indicator
require("fidget").setup({})
