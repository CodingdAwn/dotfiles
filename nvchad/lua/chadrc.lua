-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

-- TODO 放在这合适不
require('nvim-treesitter.configs').setup({
  indent = {
    enable = false, -- 完全禁用 treesitter 缩进
    -- 或者只为特定语言启用
    -- enable = true,
    -- disable = { "c", "cpp", "python" },  -- 禁用 C/C++ 的 treesitter 缩进
  },
})

-- TODO 放到config中去
require("nvim-tree").setup({
  renderer = {
    symlink_destination = true, -- 是否显示软链接指向的真实路径
  },
  -- 3. 行为逻辑配置
  update_focused_file = {
    enable = true,
    update_root = false, -- 如果设为 true，跳进软链接时可能会导致根目录切换，建议设为 false
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    },
  },
})

return M
