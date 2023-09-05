-- print('load alpha config')
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

--require("alpha").setup(require("alpha.themes.dashboard").config)
-- 使用自己的欢迎界面
-- TODO 想做一个每日的名句放在首页

dashboard.section.header.val = {
    "   .########.....###....##......##.##....##    ",
    "   .##.....##...##.##...##..##..##.###...##    ",
    "   .##.....##..##...##..##..##..##.####..##    ",
    "   .##.....##.##.....##.##..##..##.##.##.##    ",
    "   .##.....##.#########.##..##..##.##..####    ",
    "   .##.....##.##.....##.##..##..##.##...###    ",
    "   .########..##.....##..###..###..##....##    ",
    "",
    "",
    "                               hi, i'm dAwn_",
}

alpha.setup(dashboard.config)
