--  See `:help vim.keymap.set()`

-- General keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<leader>-', vim.cmd.split, { desc = ':split' })
keymap('n', '<leader>|', vim.cmd.vsplit, { desc = ':vsplit' })

-- Insert mode shortcuts
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)
keymap('i', '<C-c>', '<Esc>')

-- Visual mode shortcuts
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")
keymap('v', '<', '<gv^', opts)
keymap('v', '>', '>gv^', opts)

-- Navigation improvements
keymap('n', 'J', 'mzJ`z')
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'replace under cursor' })

keymap('n', 'J', 'mzJ`z')
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

-- Clipboard and paste
keymap('x', '<leader>p', [["_dP]], { desc = 'p without buffering' })
keymap({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'yank to system clipboard' })
keymap('n', '<leader>Y', [["+Y]], { desc = 'yank to system clipboard' })
keymap({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'd without buffering' })
keymap({ 'n', 'v' }, '<leader>c', [["_c]], { desc = 'c without buffering' })

-- Toggle line numbers
function ToggleLineNumbers()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
    vim.wo.number = true
  end
end
keymap('n', '<leader>tl', ToggleLineNumbers, { desc = '[t]oggle relative [l]ine numbers' })

-- Ruff toggle
local ruff_active = false
vim.keymap.set('n', '<leader>tr', function()
  ruff_active = not ruff_active
  if ruff_active then
    vim.cmd 'LspStart ruff_lsp'
  else
    vim.cmd 'LspStop ruff_lsp'
  end
end, { desc = '[t]oggle [r]uff' })

-- Tagbar
keymap('n', '<leader>ttb', '<cmd>TagbarToggle<CR>', { desc = 'toggle tagbar' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- keymap("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- keymap("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- keymap("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- keymap("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
