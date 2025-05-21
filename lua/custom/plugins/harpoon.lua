return {
  'theprimeagen/harpoon', -- Efficient file and buffer navigation
  event = 'VeryLazy',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'harpoon add' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

    vim.keymap.set('n', '<leader>1', function()
      ui.nav_file(1)
    end, { desc = 'harpoon go to 1st file' })
    vim.keymap.set('n', '<leader>2', function()
      ui.nav_file(2)
    end, { desc = 'harpoon go to 2nd file' })
    vim.keymap.set('n', '<leader>3', function()
      ui.nav_file(3)
    end, { desc = 'harpoon go to 3rd file' })
    vim.keymap.set('n', '<leader>4', function()
      ui.nav_file(4)
    end, { desc = 'harpoon go to 4th file' })
  end,
}
