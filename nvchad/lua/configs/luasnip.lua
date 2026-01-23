-- maybe not needed nvchad alread had one
local loader = require("luasnip.loaders.from_vscode")

-- 1. 加载插件下载的 friendly-snippets (不传 paths 默认加载所有 runtimepath 下的 snippets)
loader.lazy_load()

-- 2. 加载你自定义的 snippets (必须保证该目录下有 package.json)
loader.lazy_load({
  paths = { vim.fn.expand("~/.config/nvim/my_snippets") }
})

-- 直接在这里定义snip是因为date，
-- 上面的方式是定义json，使用一些默认函数，但是最终生成的date有问题
-- 这里直接调用lua更准确方便
-- FIX 这个也不需要了，现在leetcode工程中用脚本直接一块生成了
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

-- 定义获取日期的函数
local function get_date()
  return os.date("%Y.%m.%d")
end

-- 定义获取文件名的函数 (模拟 TM_FILENAME)
local function get_filename(_, snip)
  return snip.env.TM_FILENAME or vim.fn.expand("%:t")
end

ls.add_snippets("cpp", {
  s({
    trig = "lt",
    dscr = "LeetCode 解题文件头"
  }, fmt([[
        /**
         * File    : {}
         * Author  : dAwn_
         * Date    : {}
         * Purposes: {}-{}-{}
         * {}
        */

        {}
    ]], {
    f(get_filename),     -- 对应 TM_FILENAME
    f(get_date),         -- 对应日期变量，完美解决不生效问题
    i(1, "问题编号"),
    i(2, "问题难度"),
    i(3, "问题名称"),
    i(4, "https://leetcode-cn.com/problems/"),
    i(0)     -- 光标最后停留的位置
  }))
})

local cmp = require('cmp')
local luasnip = require('luasnip')

-- 1. 配置 Luasnip (防止跳转历史残留)
luasnip.config.set_config({
  region_check_events = 'InsertEnter', -- 重新进入插入模式时检查区域
  delete_check_events = 'InsertLeave', -- 离开插入模式时清除不需要的 Snippet 节点
})

-- 2. 配置 nvim-cmp
cmp.setup({
  mapping = {
    -- 【补全逻辑】
    -- Tab 仅用于菜单选择
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback() -- 正常的 Tab 缩进
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- 【Snippet 跳转逻辑】
    -- 使用 Ctrl + l 跳转到下一个参数位 (Forward)
    ['<C-l>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- 使用 Ctrl + h 跳转到上一个参数位 (Backward)
    ['<C-h>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- 回车直接确认补全
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
  },

  -- 必须指定 snippet 引擎
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- 其他 cmp 设置...
})
