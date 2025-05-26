return {
  'nvim-lualine/lualine.nvim', -- Highly configurable status line
  config = function()
    require('lualine').setup {
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
      },
    }
  end,
}
