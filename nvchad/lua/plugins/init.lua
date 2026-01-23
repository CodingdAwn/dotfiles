return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "CodingdAwn/vim-translator",
    lazy = false,
  },

  -- wiki
  {
    "vimwiki/vimwiki",
    keys = {
      { "<leader>ww", "<cmd>VimwikiIndex<cr>", mode = "n", desc = "vim wiki" },
    },
    init = function()
      vim.cmd("let g:vimwiki_list = [{'path': '~/dotfiles/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
      vim.cmd("let g:vimwiki_global_ext = 0")
    end,
    config = function()
      -- autocmd FileType wiki,vimwiki nnoremap <buffer> <leader>wd :VimwikiToggleListItem<CR>
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "wiki", "vimwiki" },
        command = [[nnoremap <buffer> <leader>wd :VimwikiToggleListItem<CR>]],
      })
    end,
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "md" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- git
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  -- alpha
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("configs.alpha")
    end,
  },

  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },

  {
    "kawre/leetcode.nvim",
    -- build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Leet",
    opts = {
      arg = "leetcode.nvim",
      lang = "cpp",
      cn = {   -- leetcode.cn
        enabled = false,
        translator = false,
        translate_problems = false,
      },
      storage = {
        home = "~/data",
        cache = "~/cache",
      },

      plugins = {
        non_standalone = false,
      },

      logging = true,
      injector = {
        ["cpp"] = {
          imports = function()
            -- return a different list to omit default imports
            return { "#include <bits/stdc++.h>", "using namespace std;" }
          end,
          --after = "int main() {}",
        },
      },
      cache = {
        update_interval = 60 * 60 * 24 * 7,
      },

      editor = {
        reset_previous_code = true,
        fold_imports = true,
      },

      console = {
        open_on_runcode = true,
        dir = "row",
        size = {
          width = "90%",
          height = "75%",
        },

        result = {
          size = "60%",
        },

        testcase = {
          virt_text = true,
          size = "40%",
        },
      },

      description = {
        position = "left",
        width = "40%",
        show_stats = true,
      },

      picker = { provider = nil },
      hooks = {
        ["enter"] = {},
        ["question_enter"] = {},
        ["leave"] = {},
      },

      keys = {
        toggle = { "q" },
        confirm = { "<CR>" },

        reset_testcases = "r",
        use_testcase = "U",
        focus_testcases = "H",
        focus_result = "L",
      },

      theme = {},
      image_support = false,
    },
  }

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
