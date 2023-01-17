-- autocmd FileType wiki,vimwiki nnoremap <buffer> <leader>wd :VimwikiToggleListItem<CR>
vim.api.nvim_create_autocmd("FileType",
    { pattern = { "wiki", "vimwiki" }, command = [[nnoremap <buffer> <leader>wd :VimwikiToggleListItem<CR>]] })

vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
vim.cmd("let g:vimwiki_global_ext = 0")
