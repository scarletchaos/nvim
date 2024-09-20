vim.opt.guicursor =
	"n-v-c-sm:block-blinkwait700-blinkoff400-blinkon250,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250-,r-cr-o:hor20,a:Cursor/Cursor"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- vim.api.nvim_exec('set langmap=йцукенгшщзхъёфывапролджэячсмитьбюქწერტყუიოპასდფგჰჯკლზხცვბნმ;qwertyuiop[]\\asdfghjkl\;'zxcvbnm\,.qwertyuiopasdfghjklzxcvbnm')
