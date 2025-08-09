require("core.options")

require("core.lazy_init")

local autocmd = vim.api.nvim_create_autocmd

vim.cmd.colorscheme "catppuccin"
vim.cmd.colorscheme "naysayer"

autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts) -- исправления

        vim.keymap.set("n", "gd", function() require('telescope.builtin').lsp_definitions() end, opts)
        vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, opts)

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    end,
})

require("luasnip.loaders.from_vscode").lazy_load()

-- Run gofmt + goimports on save

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
