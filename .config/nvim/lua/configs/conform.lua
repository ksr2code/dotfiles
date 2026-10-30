local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- c = { "norminette" }, -- requires: pip install c-formatter-42
    -- h = { "norminette" }, -- requires: pip install c-formatter-42
    -- python = { "autopep8" }, -- requires: pip install autopep8
    -- go = { "gofumpt", "goimports-reviser", "golines" }, -- golines requires: go install github.com/segmentio/golines@latest
  },
  formatters = {
    -- norminette = {
    --   command = "c_formatter_42",
    -- },
    -- ["goimports-reviser"] = {
    --   prepend_args = { "-rm-unused" },
    -- },
    -- golines = {
    --   command = vim.fn.expand "$HOME/go/bin/golines",
    --   prepend_args = { "--max-len=80" },
    -- },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },

}
require("conform").setup(options)
