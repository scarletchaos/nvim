-- nvim v0.8.0
return {
  'kdheepak/lazygit.nvim',
  priority = 500,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
  config = function()
    local group = vim.api.nvim_create_augroup('LazyGitFocus', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'FocusGained' }, {
      group = group,
      callback = function()
        if vim.bo.buftype ~= 'terminal' then
          return
        end
        if vim.bo.filetype == 'lazygit' then
          vim.cmd('startinsert')
        end
      end,
    })
  end,
}
