print('load options')

-- TODO 把opt的设置 keymap au function都分离开 插件的配置也分开
-- relative number
vim.opt.relativenumber = true

-- 高亮选中
vim.opt.hlsearch = true
-- vim.cmd('hi Search cterm=reverse guifg=#282c34 guibg=#d19a66')

-- 自动缩进
vim.opt.autoindent = true
-- 打开 C/C++ 语言缩进优化
vim.opt.cindent = true

-- 关闭自动换行
vim.opt.wrap = false

-- 禁用交换文件
vim.opt.swapfile = false

-- 禁用 undo文件
vim.opt.undofile = false

vim.opt.compatible = false
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

if vim.fn.has('multi_byte') == 1 then
  -- 内部工作编码
  vim.opt.encoding = "utf-8"
  -- 文件默认编码
  vim.opt.fileencoding = "utf-8"
  -- 打开文件时自动尝试下面顺序的编码
  vim.opt.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1"
end

-- 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
-- 或者 Vim 当前目录包含 .tags 文件
vim.opt.tags = "./.tags;,.tags"

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
