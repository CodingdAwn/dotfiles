-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

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

vim.api.nvim_create_autocmd('BufRead', {
    desc = 'set python tab config',
    group = vim.api.nvim_create_augroup('pythontab', { clear = true }),
    callback = function(opts)
        if vim.bo[opts.buf].filetype == 'python' then
            vim.opt_local.sw = 4
            vim.opt_local.ts = 4
            vim.opt_local.expandtab = false
        end
    end,
})

