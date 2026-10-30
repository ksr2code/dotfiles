-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "github_dark", -- keep this or switch to "dark_hard" / "onedark" as base

  hl_override = {
    -- General text colors
    Normal = { bg = "NONE", fg = "#CBE0F0" },
    NormalFloat = { bg = "NONE", fg = "#CBE0F0" },
    FloatBorder = { fg = "#62cae6", bg = "NONE" },

    -- Tabufline / open buffers
    TbFill = { bg = "NONE", fg = "#6A7D8F" },
    TbBufOn = { bg = "#033259", fg = "#62cae6" },
    TbBufOff = { bg = "#011423", fg = "#6A7D8F" },
    TbBufOnClose = { bg = "#033259", fg = "#62cae6" },
    TbBufOffClose = { bg = "#011423", fg = "#6A7D8F" },
    TbBufOnModified = { bg = "#033259", fg = "#47FF9C" },
    TbBufOffModified = { bg = "#011423", fg = "#47FF9C" },
    TbThemeToggleBtn = { bg = "NONE", fg = "#62cae6" },
    TbCloseAllBufsBtn = { bg = "NONE", fg = "#62cae6" },
    St_cwd = { bg = "NONE", fg = "#89b4fa", bold = true },
    St_Lsp = { bg = "NONE", fg = "#89b4fa" },
    StText = { bg = "NONE", fg = "#FFE073" },
    St_NormalMode = { bg = "NONE" },
    St_VisualMode = { bg = "NONE" },
    St_InsertMode = { bg = "NONE" },
    St_CommandMode = { bg = "NONE" },
    St_TerminalMode = { bg = "NONE" },
    St_NTerminalMode = { bg = "NONE" },

    -- Cursor
    Cursor = { bg = "#47FF9C", fg = "#011423" },
    CursorLine = { bg = "#033259" },
    CursorLineNr = { fg = "#47FF9C", bold = true },

    -- Selection
    Visual = { bg = "#033259", fg = "NONE" },
    Pmenu = { bg = "#033259", fg = "#CBE0F0" },
    PmenuSel = { bg = "#214969", fg = "#CBE0F0" },

    -- -- Comments italic
    Comment = { fg = "#6A7D8F", italic = true },
    ["@comment"] = { fg = "#6A7D8F", italic = true },

    -- Diff colors
    DiffChange = { bg = "#464414", fg = "NONE" },
    DiffAdd = { bg = "#103507", fg = "NONE" },
    DiffRemoved = { bg = "#461414", fg = "NONE" },

    -- NvimTree background fix
    NvimTreeNormal = { bg = "NONE", fg = "#CBE0F0" },
    NvimTreeNormalNC = { bg = "NONE", fg = "#CBE0F0" },
    NvimTreeEndOfBuffer = { bg = "NONE", fg = "#011423" }, -- keeps tildes subtle
    NvimTreeCursorLine = { bg = "#033259" },

    -- Telescope fixes (add these)
    TelescopeNormal = { bg = "NONE", fg = "#CBE0F0" },
    TelescopeBorder = { fg = "#62cae6", bg = "NONE" },
    TelescopePromptPrefix = { fg = "#62cae6", bg = "NONE" },
    TelescopePromptNormal = { bg = "NONE", fg = "#CBE0F0" },
    TelescopePromptBorder = { fg = "#62cae6", bg = "NONE" },
    TelescopePromptTitle = { fg = "#62cae6", bg = "NONE" },
    TelescopeResultsTitle = { fg = "#62cae6", bg = "NONE" },
    TelescopePreviewTitle = { fg = "#62cae6", bg = "NONE" },
    TelescopeSelection = { bg = "#214969", fg = "#47FF9C" },
    TelescopeMatching = { bg = "#033259", fg = "#aea71c" },
  },

  hl_add = {
    -- Neogit diff text colors (ACTUAL fix)
    NeogitDiffAddText = { fg = "#47FF9C" },
    NeogitDiffDeleteText = { fg = "#e06c75" },

    NeogitDiffAddHighlight = { bg = "#103507" },
    NeogitDiffDeleteHighlight = { bg = "#461414" },

    NeogitHunkHeaderHighlight = { bg = "#033259", fg = "#CBE0F0", bold = true },
  },

  transparency = true,
  theme_toggle = { "github_dark", "chadtain" },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "block",
    order = { "mode", "file", "git", "%=", "%=", "diagnostics", "lsp", "cwd", "cursor" },
  },
}

return M
