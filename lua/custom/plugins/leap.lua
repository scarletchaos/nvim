return {
  url = 'https://codeberg.org/andyg/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    local function map_if_unset(mode, lhs, rhs, desc)
      if vim.fn.mapcheck(lhs, mode) == '' then
        vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
      end
    end

    for _, mode in ipairs { 'n', 'x', 'o' } do
      map_if_unset(mode, 's', '<Plug>(leap-forward)', 'Leap forward')
      map_if_unset(mode, 'S', '<Plug>(leap-backward)', 'Leap backward')
      map_if_unset(mode, 'gs', '<Plug>(leap-from-window)', 'Leap from window')
    end
  end,
}
