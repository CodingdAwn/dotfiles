require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach-config", { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
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

local servers = { "html", "cssls", "lua_ls", "clangd", "vtsls", "pyright", "neocmake" }
vim.lsp.enable(servers)
