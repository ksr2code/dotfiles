require "nvchad.options"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opt = vim.opt
-- Use real tabs, not spaces
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Show invisible characters
opt.listchars = {
  eol = "↓",
  space = "·",
  trail = "●",
  tab = "→⇥⇥",
  extends = ">",
  precedes = "<",
}

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
