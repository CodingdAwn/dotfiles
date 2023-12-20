-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
require "custom.autocmds"

vim.opt.relativenumber = true
-- 禁用交换文件
vim.opt.swapfile = false

-- 设置缩进宽度
vim.opt.sw = 4

-- 设置 TAB 宽度
vim.opt.ts = 4

-- 使用空格代替tab
vim.opt.expandtab = true

-- 如果后面设置了 expandtab 那么展开 tab 为多少字符
vim.opt.softtabstop = 4

vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')


