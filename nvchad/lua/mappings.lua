require "nvchad.mappings"

local nomap = vim.keymap.del
nomap("n", "<A-h>")
nomap("n", "<A-v>")
nomap("n", "<leader>h")
nomap("n", "<leader>b")
nomap("n", "<leader>fm")
nomap("n", "<leader>e")
nomap("n", "<C-n>")

nomap("t", "<A-h>")
nomap("t", "<A-v>")

-- add yours here

local map = vim.keymap.set

--map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- toggle transparency
map("n", "<leader>tp", function()
  require("base46").toggle_transparency()
end, { desc = "toggle transparency" })

map("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { desc = "format file" })

map("n", "<leader>e", function()
    require("nvim-tree.api").tree.toggle()
end, { desc = "toggle nvimtree" })

-- close window
map("n", "<leader>q", "<cmd>q<cr>", { desc = "close window" })
map("n", "<leader>cq", "<cmd>ccl<cr>", { desc = "close quickfix window" })
map("n", "<leader>cl", "<cmd>lcl<cr>", { desc = "close locallist window" })

-- increase width for windows
map("n", "<leader>wl", function()
  local width = vim.fn.winwidth(0)
  if width <= 50 then
    vim.api.nvim_win_set_width(0, width + 10)
  else
    vim.api.nvim_win_set_width(0, width + width * 0.1)
  end
end, { desc = "increase width" })

-- decrease width for windows
map("n", "<leader>wh", function()
  local width = vim.fn.winwidth(0)
  if width <= 50 then
    vim.api.nvim_win_set_width(0, width - 10)
  else
    vim.api.nvim_win_set_width(0, width - width * 0.1)
  end
end, { desc = "decrease width" })

-- clang lsp
map("n", "<leader>aa", function()
  if vim.bo.ft == "cpp" or vim.bo.ft == "c" then
    vim.cmd "LspClangdSwitchSourceHeader "
  end
end, { desc = "switch header source with clangd" })

map("n", "<leader>ah", function()
  if vim.bo.ft == "cpp" or vim.bo.ft == "c" then
    vim.cmd "split"
    vim.cmd "LspClangdSwitchSourceHeader "
  end
end, { desc = "switch header source with clangd" })

map("n", "<leader>av", function()
  if vim.bo.ft == "cpp" or vim.bo.ft == "c" then
    vim.cmd "vsplit"
    vim.cmd "LspClangdSwitchSourceHeader "
  end
end, { desc = "switch header source with clangd" })

-- alpha
map("n", "<leader>;", "<cmd>Alpha<cr>", { desc = "dash board" })

-- translator
map("n", "<leader>tw", "<cmd>TranslateW<cr>", { desc = "translate current word" })
map("n", "<leader>tt", "<cmd>Translate<cr>", { desc = "translate current word to status line" })

map("v", "<leader>tw", "<cmd>TranslateW<cr>", { desc = "translate current word" })
map("v", "<leader>tt", "<cmd>Translate<cr>", { desc = "translate current word to status line" })

-- tabufline
map("n", "<leader>bl", function()
  require("nvchad.tabufline").tabuflineNext()
end, { desc = "Goto next buffer" })

map("n", "<leader>bh", function()
  require("nvchad.tabufline").tabuflinePrev()
end, { desc = "Goto prev buffer" })

map("n", "<leader>bh", function()
  require("nvchad.tabufline").closeOtherBufs()
end, { desc = "Close other buffers" })

map("n", "<leader>bn", "<cmd> enew <CR>", { desc = "Close other buffers" })

-- copy message to system clipborad
vim.keymap.set('n', '<leader>ym', ':redir @+ | silent messages | redir END<CR>', {
    desc = 'Copy messages to clipboard',
    silent = true,  -- 不显示命令
})

vim.keymap.set('n', '<leader>yM', ':CopyMessagesToFile<CR>', { desc = 'Save messages to file' })
