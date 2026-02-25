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

local util = require 'lspconfig.util'
vim.lsp.config('omnisharp', {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(
      util.root_pattern '*.slnx' (fname)
      or util.root_pattern '*.sln' (fname)
      or util.root_pattern '*.csproj' (fname)
      or util.root_pattern 'omnisharp.json' (fname)
      or util.root_pattern 'function.json' (fname)
    )
  end,
  -- 启用 Roslyn 引擎
  enable_roslyn_analyzers = true,
  settings = {
    RoslynExtensionsOptions = {
      -- 必须开启，否则无法跳转到 Godot 内部 API 源码
      EnableDecompilationSupport = true,
      -- 必须开启，否则无法识别 Godot 的 Source Generators (信号、节点引用等)
      EnableAnalyzersSupport = true,
      -- 开启导入补全
      EnableImportCompletion = true,
    },
    MsBuild = {
      -- 确保能找到项目文件
      LoadProjectsOnDemand = false,
    },
    Sdk = {
      IncludePrereleases = true,
    },
  },
})

local servers = { "html", "cssls", "lua_ls", "clangd", "vtsls", "pyright", "neocmake", "basedpyright", "omnisharp" }
vim.lsp.enable(servers)
