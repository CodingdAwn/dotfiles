-- ~/.config/nvim/after/ftplugin/cpp.lua
-- Qt 特定配置

-- 设置 Qt 头文件路径
vim.bo.include = vim.bo.include .. [[,\/usr/include/qt,\/usr/include/qt/Qt*]]

-- 设置 Qt 宏定义
vim.bo.define = vim.bo.define .. [[,QT_CORE_LIB,QT_GUI_LIB,QT_WIDGETS_LIB]]
