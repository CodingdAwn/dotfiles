print('load plugins')
lvim.plugins = {
    -- translator plugins
    { "CodingdAwn/vim-translator", config = function()
        require('dawn.configs.vim-translator')
    end },
    -- wiki
    { "vimwiki/vimwiki", init = function()
        require('dawn.configs.vimwiki')
    end },
    -- colorscheme
    { "olimorris/onedarkpro.nvim", config = function()
        require('dawn.configs.onedarkpro')
    end },
}
