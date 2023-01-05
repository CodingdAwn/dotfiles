-- 关闭当前buffer
vim.keymap.set('n', '<leader>cc', '<cmd>q<CR>', { desc = 'quit vim rapid' })

-- 使用jk返回normal模式
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'go to normal mode' })
vim.keymap.set('x', 'jk', '<ESC>', { desc = 'go to normal mode' })
vim.keymap.set('c', 'jk', '<ESC>', { desc = 'go to normal mode' })

-- 复制到剪切板中
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'copy to global clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'copy to global clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'paste from global clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'paste from global clipboard' })

-- 移动整行
vim.keymap.set('n', '<a-j>', '<cmd>m .+1<CR>', { desc = 'move line down' })
vim.keymap.set('n', '<a-k>', '<cmd>m .-2<CR>', { desc = 'move line up' })

-- 移动到其他windows
vim.keymap.set('n', '<leader>h', '<c-w>h', { desc = 'move windows' })
vim.keymap.set('n', '<leader>l', '<c-w>l', { desc = 'move windows' })
vim.keymap.set('n', '<leader>j', '<c-w>j', { desc = 'move windows' })
vim.keymap.set('n', '<leader>k', '<c-w>k', { desc = 'move windows' })
