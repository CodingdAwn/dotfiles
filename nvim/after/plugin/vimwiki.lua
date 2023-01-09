--autocmd FileType wiki,vimwiki nnoremap <buffer> <leader>wd :VimwikiToggleListItem<CR>
vim.api.nvim_create_autocmd("FileType", { pattern = { "wiki", "vimwiki" }, command = [[nnoremap <buffer> <leader>wd :VimwikiToggleListItem<CR>]] })
