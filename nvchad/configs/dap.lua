print('dap init')
local dap = require('dap')

dap.adapters.coreclr = {
    type = 'executable',
    command = '/usr/local/netcoredbg',
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/Bin/', 'file')
        end,
        --        args = { "--Console=1" },
        cwd = "${workspaceFolder}/bin/",
        justMyCode = true
    },
}
