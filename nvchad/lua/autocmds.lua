require "nvchad.autocmds"

--[[ 这种方式没有复制成功但是直接命令模式直接输入是可以的，直接在map中定义也是可以的
vim.api.nvim_create_user_command('CopyMessages', function()
  vim.cmd('redir @+ | silent messages | redir END')
  vim.notify('Messages copied to clipboard', vim.log.levels.INFO)
end, { desc = 'Copy all messages to clipboard' })
]]

vim.api.nvim_create_user_command('CopyMessagesToFile', function(opts)
  local filepath = opts.args ~= '' and opts.args or '/tmp/vim_messages.txt'
  vim.cmd('redir > ' .. filepath .. ' | silent messages | redir END')
  vim.notify('Messages saved to: ' .. filepath, vim.log.levels.INFO)
end, { desc = 'Save messages to file', nargs = '?' }) -- ? 表示可选参数
