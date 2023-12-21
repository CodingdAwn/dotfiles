---@type MappingsTable
local M = {}

-- disable some origin mappings
M.disabled = {
	n = {
		["<A-h>"] = "",
		["<A-v>"] = "",
		["<leader>h"] = "",
		["<leader>v"] = "",
		["<leader>q"] = "",
		["<leader>b"] = "",
	},

	t = {
		["<A-h>"] = "",
		["<A-v>"] = "",
	},
}

M.general = {
	n = {
		--[";"] = { ":", "enter command mode", opts = { nowait = true } },

		-- toggle transparency
		["<leader>tp"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
			opts = { nowait = true },
		},

		-- close window
		["<leader>q"] = { "<cmd>q<cr>", "close window", opts = { nowait = true } },

        -- increase width for windows
        ["<leader>wl"] = { function ()
            local width = vim.fn.winwidth(0)
            if (width <= 50) then
                vim.api.nvim_win_set_width(0, width + 10)
            else
                vim.api.nvim_win_set_width(0, width + width * 0.1)
            end
        end, "increase width", opts = { nowait = true } },

        -- decrease width for windows
        ["<leader>wh"] = { function ()
            local width = vim.fn.winwidth(0)
            if (width <= 50) then
                vim.api.nvim_win_set_width(0, width - 10)
            else
                vim.api.nvim_win_set_width(0, width - width * 0.1)
            end
        end, "increase width", opts = { nowait = true } },
	},
}

M.lsp = {
	n = {
		["<leader>ll"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},
		["<leader>aa"] = {
			function()
                if (vim.bo.ft == "cpp" or vim.bo.ft == "c") then
                    vim.cmd("ClangdSwitchSourceHeader ")
                end
			end,
			"switch header source with clangd",
		},
		["<leader>ah"] = {
			function()
                if (vim.bo.ft == "cpp" or vim.bo.ft == "c") then
                    vim.cmd("split")
                    vim.cmd("ClangdSwitchSourceHeader ")
                end
			end,
			"switch header source with clangd",
		},
		["<leader>av"] = {
			function()
                if (vim.bo.ft == "cpp" or vim.bo.ft == "c") then
                    vim.cmd("vsplit")
                    vim.cmd("ClangdSwitchSourceHeader ")
                end
			end,
			"switch header source with clangd",
		},
	},
}

-- more keybinds!
M.nvimtree = {
	n = {
		["g?"] = { "lua require('nvim-tree.api').tree.toggle_help", "nvimtree Help" },
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

M.tabufline = {
	n = {
		["<leader>bl"] = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"Goto next buffer",
		},

		["<leader>bh"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"Goto prev buffer",
		},

		["<leader>bc"] = {
			function()
				require("nvchad.tabufline").closeOtherBufs()
			end,
			"Close other buffers",
		},

		["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
	},
}

return M
