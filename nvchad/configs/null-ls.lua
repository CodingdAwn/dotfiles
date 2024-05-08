local null_ls = require "null-ls"
--print('null-ls load')

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format.with { filetypes = { "cpp", "c" } },

  -- csharp
  b.formatting.csharpier.with { filetypes = { "cs" } },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
--vim.lsp.buf.format { timeout_ms = 2000 }
--vim.lsp.buf.format { async = true }
