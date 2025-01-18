-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}


M.base46 = {
  theme = "one_light",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Number = { bold = true },
    ["@number"] = { bold = true },
    Boolean = { bold = true },
    ["@boolean"] = { bold = true },
    ["@function.method.call"] = { italic = true },
    ["@function.call"] = { bold = true }
  },

}

M.ui = {
  tabufline = {
    enabled = false
  },
  statusline = {
    theme = "vscode"
  },
  cmp = {
    style = "atom_colored"
  }
}



return M
