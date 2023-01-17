print('load nvim tree')
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
-- require("nvim-tree").setup({
--     sort_by = "case_sensitive",
--     view = {
--         adaptive_size = true,
--         side = "right",
--         mappings = {
--             list = {
--                 { key = "u", action = "dir_up" },
--                 { key = "cd", action = "cd" },
--             },
--         },
--     },
--     renderer = {
--         group_empty = true,
--     },
--     filters = {
--         dotfiles = true,
--     },
--     sync_root_with_cwd = true,
-- })

-- vim.keymap.set('n', '<leader>no', '<cmd>NvimTreeFocus<CR>')
-- vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>')
-- vim.keymap.set('n', '<leader>nf', '<cmd>NvimTreeFindFile<CR>')
-- vim.keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>')

lvim.builtin.which_key.mappings["n"] = {
    name = "nvim-tree",
    o = { "<cmd>NvimTreeFocus<CR>", "NvimTreeFocus" },
    t = { "<cmd>NvimTreeToggle<CR>", "NvimTreeToggle" },
    f = { "<cmd>NvimTreeFindFile<CR>", "NvimTreeFindFile" },
    r = { "<cmd>NvimTreeRefresh<CR>", "NvimTreeRefresh" },
}

vim.builtin.nvimtree.setup.view.side = "right"
vim.builtin.nvimtree.setup.renderer.icons.show.git = false
