-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = "right",
    --[[
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "cursor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
    --]]
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<leader>no', '<cmd>NvimTreeFocus<CR>')
vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>nf', '<cmd>NvimTreeFindFile<CR>')
vim.keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>')
