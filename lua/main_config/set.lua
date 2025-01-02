-- Cursor settings
vim.opt.guicursor = "n-v-c-sm:block-blinkwait700-blinkoff400-blinkon250,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250-,r-cr-o:hor20,a:Cursor/Cursor"

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Text wrapping
vim.opt.wrap = false

-- Backup and undo settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Filename settings
vim.opt.isfname:append("@-@")

-- Performance
vim.opt.updatetime = 50

-- Language mapping
vim.opt.langmap = "йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮёË;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL\\;\\:\'\"zZxXcCvVbBnNmM\\,\\<\\.\\>`~"

