-- -----------------------------------------------------------------
-- remove this after nvim upgrades to v12
-- -----------------------------------------------------------------
-- Override notify to filter out lspconfig deprecation
local orig_notify = vim.notify

vim.notify = function(msg, ...)
  if type(msg) == "string" and msg:match("lspconfig") then
    return
  end
  orig_notify(msg, ...)
end
--------------------------------------------------------------------


-- Load NVChad defaults
require("nvchad.configs.lspconfig").defaults()

local configs = require "nvchad.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

-------------------------------------------------------------
-- CLANGD (C/C++)
-------------------------------------------------------------
-- lspconfig.clangd.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities,
-- }

-------------------------------------------------------------
-- PYRIGHT (Python)
-------------------------------------------------------------
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-------------------------------------------------------------
-- GOPLS (Go)
-------------------------------------------------------------
-- lspconfig.gopls.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities,
--   settings = {
--     gopls = {
--       analyses = { unusedparams = true },
--       completeUnimported = true,
--       usePlaceholders = true,
--       staticcheck = true,
--     },
--   },
-- }

-------------------------------------------------------------
-- POSTGRES_LSP (SQL / PostgreSQL)
-------------------------------------------------------------
-- lspconfig.postgres_lsp.setup {
--   cmd = { 'postgres-language-server', 'lsp-proxy' },
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- -----------------------------------------------------------------
-- remove this after nvim upgrades to v12
-- -----------------------------------------------------------------
-- Restore notify so other messages are visible
vim.notify = orig_notify
-- -----------------------------------------------------------------
