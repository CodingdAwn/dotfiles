---@type MappingsTable
local M = {}

-- disable some origin mappings
M.disabled = {
  n = {
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  },

  t = {
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- toggle transparency
    ["<leader>tp"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
      opts = { nowait = true },
    },
  },
}

-- more keybinds!
M.nvimtree = {
  n = {
    ["g?"] = { "lua require('nvim-tree.api').tree.toggle_help", "nvimtree Help" },
  },
}

M.vimwiki = {
  n = {
    ["<leader>ww"] = { "<cmd>VimwikiIndex<cr>", "index for vimwiki" },
  },
}

M.alpha = {
  n = {
    ["<leader>;"] = { "<cmd>Alpha<cr>", "dash board", opts = { nowait = true } },
  },
}

M.translator = {
  n = {
    ["<leader>tw"] = { "<cmd>TranslateW<cr>", "translate current word", opts = { nowait = true } },
    ["<leader>tt"] = { "<cmd>Translate<cr>", "translate current word to status line", opts = { nowait = true } },
  },

  v = {
    ["<leader>tw"] = { "<cmd>TranslateW<cr>", "translate current word", opts = { nowait = true } },
    ["<leader>tt"] = { "<cmd>Translate<cr>", "translate current word to status line", opts = { nowait = true } },
  },
}

return M
