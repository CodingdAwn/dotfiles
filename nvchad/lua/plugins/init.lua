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
      vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
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

  -- snip
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      --require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/my_snippets" })
      --require("luasnip.loaders.from_vscode").lazy_load()
      require "configs.luasnip"
    end,
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
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
