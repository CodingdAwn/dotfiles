local overrides = require("custom.configs.overrides")

vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
vim.cmd("let g:vimwiki_global_ext = 0")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }

	-- custom plugins
	{
		"CodingdAwn/vim-translator",
		lazy = false,
	},

	-- wiki
	{
		"vimwiki/vimwiki",
		lazy = false,
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

	-- preview definition
	{
		"rmagatti/goto-preview",
		lazy = false,
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},

	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			require("custom.configs.alpha")
		end,
	},

	-- vim-doge generator comment
	{
		"kkoomen/vim-doge",
        lazy = false,
		cmd = { "DogeGenerate" },

		build = function()
			vim.fn["doge#install"]()
		end,
		init = function()
			require("core.utils").load_mappings("doge")
			vim.g.doge_doc_standard_cs = "xmldoc"
			vim.g.doge_doc_standard_lua = "ldoc"
		end,
	},
}

return plugins
