return {
  'azorng/goose.nvim',
  branch = 'main',
  init = function()
    -- prevent the default setup() from ever running
    vim.g.loaded_goose_nvim = 1
  end,
  config = function()
    require('goose').setup {
      keymap = {
        global = {
          toggle = '<leader>eg', -- Open goose. Close if opened
          open_input = '<leader>ei', -- Opens and focuses on input window on insert mode
          open_input_new_session = '<leader>eI', -- Opens and focuses on input window on insert mode. Creates a new session
          open_output = '<leader>eo', -- Opens and focuses on output window
          toggle_focus = '<leader>et', -- Toggle focus between goose and last window
          close = '<leader>eq', -- Close UI windows
          toggle_fullscreen = '<leader>ef', -- Toggle between normal and fullscreen mode
          select_session = '<leader>es', -- Select and load a goose session
        },
        window = {
          submit = '<cr>', -- Submit prompt
          close = '<esc>', -- Close UI windows
          stop = '<C-c>', -- Stop a running job
          next_message = ']]', -- Navigate to next message in the conversation
          prev_message = '[[', -- Navigate to previous message in the conversation
          mention_file = '@', -- Pick a file and add to context. See File Mentions section
          toggle_pane = '<tab>', -- Toggle between input and output panes
        },
      },
      ui = {
        window_width = 0.35, -- Width as percentage of editor width
        input_height = 0.15, -- Input height as percentage of window height
        fullscreen = false, -- Start in fullscreen mode (default: false)
        layout = 'right', -- Options: "center" or "right"
        floating_height = 0.8, -- Height as percentage of editor height for floating layout
      },
    }

  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        anti_conceal = { enabled = false },
      },
    },
  },
}

-- Default configuration with all available options
