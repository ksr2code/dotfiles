require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("i", "jj", "<ESC>")

map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Vertical Split" })

-- Terminal
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toogle Terminal Vertical" })
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Toogle Terminal Horizontal" })
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Toogle Terminal Vertical" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toogle Terminal Horizontal" })
map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<Esc>", "<Cmd>stopinsert<CR>", {
  noremap = true,
  silent = true,
  desc = "Exit terminal mode",
})

--Norminette linter/autoformat
-- map("n", "<leader>kc", function() -- requires: norminette-lint.nvim plugin + pip install norminette
--   require("norminette-lint").toggle()
--   vim.notify "Toggled Norminette linting"
-- end, { desc = "Toggle Norminette Linter" })
map({ "n", "v" }, "<leader>kf", function()
  require("conform").format { async = true }
end, { desc = "Format file" })
-- Lint (filetype-aware: flake8 for python, golangci-lint for go)
map("n", "<leader>kl", function()
  local ft = vim.bo.filetype
  local linters = require("lint").linters_by_ft[ft]
  local names = type(linters) == "table" and table.concat(linters, ", ") or "none"
  require("lint").try_lint()
  vim.notify("Lint [" .. ft .. "]: " .. names)
end, { desc = "Run linter for current filetype" })
--Python shebang
map("n", "<leader>ki", function()
  require("configs.python_shebang").add_boilerplate()
  vim.notify "Shebang added"
end, {
  desc = "Add Python shebang",
})

-- Debug (requires DAP plugins - commented out in plugins/init.lua)
-- map("n", "<leader>du", function()
--   require("dapui").toggle()
-- end, { desc = "Toggle Debug UI" })
-- map("n", "<leader>db", function()
--   require("dap").toggle_breakpoint()
-- end, { desc = "Toggle Breakpoint" })
-- map("n", "<leader>ds", function()
--   require("dap").continue()
-- end, { desc = "Start / Continue" })
-- map("n", "<leader>dn", function()
--   require("dap").step_over()
-- end, { desc = "Step Over" })
-- map("n", "<leader>di", function()
--   require("dap").step_into()
-- end, { desc = "Step Into" })
-- map("n", "<leader>do", function()
--   require("dap").step_out()
-- end, { desc = "Step Out" })
-- map("n", "<leader>dq", function()
--   require("dap").terminate()
-- end, { desc = "Terminate Debugging" })

-- ===============================
-- Dadbod (database UI)
-- ===============================
map("n", "<leader>Du", "<cmd>DBUIToggle<cr>", { desc = "DBUI Toggle" })
map("n", "<leader>Df", "<cmd>DBUIFindBuffer<cr>", { desc = "DBUI Find buffer" })
map("n", "<leader>Da", "<cmd>DBUIAddConnection<cr>", { desc = "DBUI Add connection" })

--autocomplete
vim.keymap.set("n", "<leader>ac", function()
  local cmp = require "cmp"
  local current = cmp.get_config().completion.autocomplete
  cmp.setup.buffer {
    completion = {
      autocomplete = current == false and { require("cmp.types").cmp.TriggerEvent.TextChanged } or false,
    },
  }
  print("Autocomplete: " .. (current == false and "enabled" or "disabled"))
end, { desc = "Toggle Autocomplete" })

local map = vim.keymap.set

-- ===============================
-- LSP diagnostic navigation
-- ===============================
map("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Show LSP diagnostics in floating window" })

-- ===============================
-- Docstring hide/show (Tree-sitter folding)
-- ===============================
map("n", "<leader>td", function()
  -- enable treesitter folding
  vim.wo.foldmethod = "expr"
  vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

  if vim.wo.foldlevel == 0 then
    vim.wo.foldlevel = 99
    vim.notify "Docstrings shown"
  else
    vim.wo.foldlevel = 0
    vim.notify "Docstrings hidden"
  end
end, { desc = "Toggle docstring visibility" })

-- ===============================
-- Neogit
-- ===============================
map("n", "<leader>gg", "<cmd>Neogit kind=floating<cr>", { desc = "Show Neogit UI" })
-- Diffview toggle with a single key
map("n", "<leader>gd", function()
  local ok, diffview = pcall(require, "diffview.lib")
  if not ok then
    return
  end
  -- if any diffview tab is open, close it; otherwise open
  if diffview.get_current_view() then
    vim.cmd "DiffviewClose"
  else
    vim.cmd "DiffviewOpen"
  end
end, { desc = "Toggle Diffview" })

-- ===============================
-- Tmux Navigator
-- ===============================
map({ "n", "t" }, "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Tmux: Navigate Left" })
map({ "n", "t" }, "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Tmux: Navigate Down" })
map({ "n", "t" }, "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Tmux: Navigate Up" })
map({ "n", "t" }, "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux: Navigate Right" })
