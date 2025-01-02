require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require('dap').set_log_level('TRACE')

vim.schedule(function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- DAP UI setup
    dapui.setup()

    -- Keymaps for DAP actions
    local keymap = vim.keymap.set
    local mappings = {
        { "<leader>td", dapui.toggle, "[t]oggle [d]apUI" },
        { "<leader>bp", dap.toggle_breakpoint, "[b]reak[p]oint" },
        { "<leader>bc", function()
            local cond = vim.fn.input('Condition: ')
            dap.toggle_breakpoint(cond)
        end, "[b]reakpoint [c]onditional" },
        { "<leader>dc", dap.continue, "[c]ontinue" },
        { "<leader>dr", dap.repl.open, "[r]epl" },
        { "<leader>so", dap.step_over, "[s]tep [o]ver" },
        { "<leader>si", dap.step_into, "[s]tep [i]n" },
    }

    for _, map in ipairs(mappings) do
        keymap("n", map[1], map[2], { noremap = true, desc = map[3] })
    end

    -- Python DAP configurations
    dap.configurations.python = {
        {
            type = 'python',
            request = 'launch',
            name = 'Debug current test',
            program = '${workspaceFolder}/manage.py',
            args = function()
                local pattern = vim.fn.expand('%:t')
                return { 'test', '--pattern', pattern, '--keepdb' }
            end,
            django = true,
            justMyCode = false,
        },
        {
            type = 'python',
            request = 'attach',
            connect = {
                host = '127.0.0.1',
                port = 5678, -- Match the `debugpy` port
            },
            mode = 'remote',
            name = 'Attach to running Django server',
            justMyCode = false,
        },
    }

    -- Python DAP adapter
    dap.adapters.python = {
        type = 'server',
        host = '127.0.0.1',
        port = 5678, -- Use the same port as in the `debugpy` command
    }
end)

