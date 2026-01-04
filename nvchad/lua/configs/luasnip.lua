local loader = require("luasnip.loaders.from_vscode")

-- 1. 加载插件下载的 friendly-snippets (不传 paths 默认加载所有 runtimepath 下的 snippets)
loader.lazy_load()

-- 2. 加载你自定义的 snippets (必须保证该目录下有 package.json)
loader.lazy_load({
    paths = { vim.fn.expand("~/.config/nvim/my_snippets") }
})

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
         * Purposes: {}-{}
         * {}
         */

        using namespace std;

        {}
    ]], {
        f(get_filename), -- 对应 TM_FILENAME
        f(get_date),     -- 对应日期变量，完美解决不生效问题
        i(1, "问题编号"),
        i(2, "问题名称"),
        i(3, "https://leetcode-cn.com/problems/"),
        i(0) -- 光标最后停留的位置
    }))
})
