return {
  'ggandor/leap.nvim', -- Fast and intuitive motions within files
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    require('leap').create_default_mappings()
  end,
}
