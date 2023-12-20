--print("just test load auto cmd")

vim.api.nvim_create_autocmd('BufRead', {
    desc = 'set python tab config',
    group = vim.api.nvim_create_augroup('pythontab', { clear = true }),
    callback = function(opts)
        if vim.bo[opts.buf].filetype == 'python' then
            vim.opt_local.sw = 4
            vim.opt_local.ts = 4
            vim.opt_local.expandtab = false
        end
    end,
})

