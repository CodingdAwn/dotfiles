--package.path = "/home/dawn/.config/nvim/?.lua;" .. package.path
-- 这样加载lua是因为 直接require 会找不到kickstart.lua
-- 原因是package.path没有这个目录 但是上述注释的使用方法在别的设备上就不行了
-- 主要是想要使用默认的kickstart.lua 然后加载完默认的所有东西在 设置一些自己的配置
vim.cmd [[ luafile ~/.config/nvim/kickstart.lua]]
-- 加载萌新配置
--require('kickstart')

-- 加载自定义配置
require('dawn')
