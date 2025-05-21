return {
  'kylechui/nvim-surround', -- Manage surrounding text (quotes, brackets, etc.)
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup {}
  end,
}
