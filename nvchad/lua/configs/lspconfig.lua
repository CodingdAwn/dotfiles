require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach-config", { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    -- 定义一个快捷工具函数，减少重复代码
    local _map_ = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end
    --local opts = { buffer = bufnr, noremap = true, silent = true }
    _map_("n", "gi", vim.lsp.buf.implementation, "go to implementation")

    _map_("n", "<leader>rn", vim.lsp.buf.rename, "rename")

    _map_({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "code action")

    _map_("n", "gr", vim.lsp.buf.references, "go to references")

    -- diagnostic
    _map_("n", "<leader>dj", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, "Diagnostic: move to next")
    _map_("n", "<leader>dk", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, "Diagnostic: move to prev")
    _map_("n", "<leader>df", vim.diagnostic.open_float, "Diagnostic: open float")
    _map_("n", "<leader>ds", vim.diagnostic.setloclist, "Diagnostic: local lsit")
  end,
})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

vim.lsp.config('neocmake', {
  capabilities = capabilities,
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_markers = { ".git", "build", "cmake" },
  single_file_support = true, -- suggested
  init_options = {
    format = {
      enable = true
    },
    lint = {
      enable = true
    },
    scan_cmake_in_package = true -- default is true
  }
})

-- for cpp
vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    -- Add the path to your compiler here (matching the one in compile_commands.json)
    "--query-driver=/usr/bin/c++,/usr/bin/clang++,/usr/bin/g++"
  },
})

local servers = { "html", "cssls", "lua_ls", "clangd", "vtsls", "pyright", "neocmake", "basedpyright" }
vim.lsp.enable(servers)
