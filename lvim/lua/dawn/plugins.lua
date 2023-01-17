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

    { "olimorris/onedarkpro.nvim", config = function()
        vim.cmd("colorscheme onedark")
    end }
}
