return {
  "mfussenegger/nvim-dap",
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'leoluz/nvim-dap-go'
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.configurations.go = {
      {
        type = 'go',
        name = 'Debug Package',
        request = 'launch',
        program = "${workspaceFolder}",              -- Change to your package path if necessary
        args = function()
          local input = vim.fn.input("Enter args: ") -- Prompt for args
          return vim.split(input, " ")               -- Split input into a table
        end,
      },
      -- Other existing configurations can remain here
    }

    dap.adapters.gdscript = {
      type = 'server',
      host = '127.0.0.1',
      port = 6006
    }
    dap.configurations.gdscript = {
      {
        type = 'gdscript',
        request = 'launch',
        name = 'Launch scene',
        project = vim.fn.getcwd(), -- Dynamically fetch the current working directory
        launch_scene = true,   -- Set to true to launch the active scene
      }
    }

    require('dap-go').setup() -- Go setup
    require('dapui').setup()  -- Go setup


    -- DAP UI Listeners
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Key mappings for DAP
    vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Quit Debugging Session" })
    vim.keymap.set("n", '<Leader>dt', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", '<Leader>dc', dap.continue, { desc = "Continue Debugging" })
    vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "Step Out" })
  end
}
