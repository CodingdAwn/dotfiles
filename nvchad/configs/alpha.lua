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
	"                            hi, it's dAwn_ here",
}

-- 找到配置目录
local function get_nvchad_custom_path()
	return "~/.config/nvim/init.lua"
end

-- custom buttons config
local buttons = {
	dashboard.button("f", "󰈞" .. "  Find File", "<CMD>Telescope find_files<CR>"),
	dashboard.button("n", "" .. "  New File", "<CMD>ene!<CR>"),
	dashboard.button("r", "" .. "  Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󰊄" .. "  Find Text", "<CMD>Telescope live_grep<CR>"),
	dashboard.button("c", "" .. "  Configuration", "<CMD>edit " .. get_nvchad_custom_path() .. " <CR>"),
	dashboard.button("q", "󰅖" .. "  Quit", "<CMD>quit<CR>"),
}

dashboard.section.buttons.val = buttons
dashboard.section.footer.val = require'alpha.fortune'()
alpha.setup(dashboard.config)
