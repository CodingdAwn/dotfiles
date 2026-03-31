local dap, dapui = require("dap"), require("dapui")

-- Use 'after' and specific keys to avoid conflicts and ensure reliability
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.after.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006, -- Default port for Godot 4
}

-- 2. Define the configuration
dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch Scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  },
  {
    type = "godot",
    request = "attach",
    name = "Attach to Godot",
    project = "${workspaceFolder}",
  },
}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<S-F5>', function()
  require('dap').terminate()
  require('dapui').close()
end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

-- Toggle UI manually if needed
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end)

require("dapui").setup()
