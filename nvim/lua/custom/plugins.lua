-- 加载自己的插件
return function(use)
  -- translator plugins
  use "CodingdAwn/vim-translator"

  -- markdown preview plugins
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- file explorer
  use({'nvim-tree/nvim-tree.lua', tag = 'nightly'})

  -- wiki
  use 'vimwiki/vimwiki'
end
