require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require('dap').set_log_level('TRACE')

vim.schedule(function()
    local ui = require("dapui")
    local dap = require("dap")
    ui.setup()

    local keymap = vim.keymap.set

    keymap("n", "<leader>td", ui.toggle, {noremap=true, desc="[t]oggle [d]apUI"})
    keymap("n", "<leader>tbp", dap.toggle_breakpoint, {noremap=true, desc="[b]reak[p]oint"})
    keymap("n", "<leader>tbc", function()
        local cond = vim.fn.input('')
        dap.toggle_breakpoint(cond)
    end, {noremap=true, desc="[b]reakpoint [c]onditional"})
    keymap("n", "<leader>dc", dap.continue, {noremap=true, desc="[c]ontinue"})
    keymap("n", "<leader>dr", dap.repl.open, {noremap=true, desc="[r]epl"})
    keymap("n", "<leader>so", dap.step_over, {noremap=true, desc="[s]tep [o]ver"})
    keymap("n", "<leader>si", dap.step_into, {noremap=true, desc="[s]tep [i]n"})
    -- If using the above, then `/path/to/venv/bin/python -m debugpy --version`
    -- must work in the shell
    dap.configurations.python = {}

    table.insert(dap.configurations.python, {
      type = 'python',
      request = 'launch',
      name = 'Debug current test',
      program = '${workspaceFolder}/manage.py',
      args = function()
        local pattern = vim.fn.expand('%:t')
        return { 'test', '--pattern', pattern, '--keepdb'}
      end,
      django = true,
      justMyCode = false,
    })

    dap.adapters.python = {
        type = 'server',
        host = '127.0.0.1',
        port = 5678, -- Use the same port as in the `debugpy` command
    }
    table.insert(dap.configurations.python, {
        type = 'python',
        request = 'attach',
        connect = {
            host = '127.0.0.1',
            port = 5678, -- Match the `debugpy` port
        },
        mode = 'remote',
        name = 'Attach to running Django server',
        justMyCode = false,
    })
end)




