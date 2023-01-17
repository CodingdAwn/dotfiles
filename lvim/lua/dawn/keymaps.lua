print('load keymaps')

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
vim.keymap.set('n', '<c-h>', '<c-w>h', { desc = 'move windows' })
vim.keymap.set('n', '<c-l>', '<c-w>l', { desc = 'move windows' })
vim.keymap.set('n', '<c-j>', '<c-w>j', { desc = 'move windows' })
vim.keymap.set('n', '<c-k>', '<c-w>k', { desc = 'move windows' })

vim.keymap.set('i', '<c-h>', '<left>', { desc = 'move windows' })
vim.keymap.set('i', '<c-l>', '<right>', { desc = 'move windows' })
vim.keymap.set('i', '<c-j>', '<down>', { desc = 'move windows' })
vim.keymap.set('i', '<c-k>', '<up>', { desc = 'move windows' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'diagnostic prev' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'diagnostic next' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'diagnostic open open_float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'diagnostic setloclist' })

-- change work dir to git root
local function cwd_git_root()
    vim.api.nvim_command('cd %:p:h')
    local git_root_path =
    require("plenary.job"):new({ command = "git", args = { "rev-parse", "--show-toplevel" } }):sync()[1]
    vim.fn.chdir(git_root_path)
    print('current cwd is ' .. git_root_path)
end

vim.keymap.set('n', '<a-r>', cwd_git_root, { desc = 'cwd to git root' })

-- 直接打开neovim config init.lua 并且设置好cwd dir
local function home_neovim_config()
    vim.api.nvim_command('e ~/.config/lvim/config.lua')
    cwd_git_root()
end

vim.keymap.set('n', '<leader>cof', home_neovim_config, { desc = 'open lvim config init.lua' })

-- Use K to show documentation in preview window
local function show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    else
        vim.lsp.buf.hover()
    end
end

vim.keymap.set("n", "K", show_docs, { desc = 'Hover Documentation', silent = true })
vim.keymap.set('n', '<leader>cd', function()
    vim.api.nvim_command('cd %:p:h')
    vim.api.nvim_command('pwd')
end, { desc = 'cwd with current buff' })

----------------------------------------------------------------------
-- 在当前光标下输出时间
----------------------------------------------------------------------
vim.keymap.set("n", "<leader>da", function()
    local date_string = vim.fn.strftime('%Y-%m-%d')
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { date_string })
end, { desc = 'Put current date at cursor pos', silent = true })
