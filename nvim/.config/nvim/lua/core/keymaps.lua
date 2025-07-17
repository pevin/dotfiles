-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)
vim.keymap.set('i', '<C-s>', '<esc><cmd> w <CR>', opts)
vim.keymap.set('n', '<leader>S', '<cmd> w <CR>', opts) -- alternative saving when shift is more accessible than crtl

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)
-- clipboard
vim.keymap.set('n', '<leader>yp', "<cmd>let @+ = expand('%')<CR>", { silent = true, desc = 'Yank relative file path' })
vim.keymap.set('n', '<leader>yc', '"+y', { silent = true, desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>yd', '"+d', { silent = true, desc = 'Delete + yank to clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { silent = true, desc = 'Paste from clipboard' })

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', { noremap = true, silent = true, desc = 'New buffer' })
vim.keymap.set('n', '<leader>bc', '<cmd> BufOnly<CR>', { noremap = true, silent = true, desc = 'Close all other buffers' })

-- Window management
vim.keymap.set('n', '<leader>wl', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>we', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>wc', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Unset last search highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true })

-- Close Neovim
vim.keymap.set('n', '<leader>Q', ':qa<CR>', { silent = true, desc = 'Quit neovim' })

-- Git
-- vim.keymap.set('n', '<leader>gg', ':Git<CR>')
-- vim.keymap.set('n', '<leader>gP', ':Git push<CR>', { desc = '[G]it [P]ush' })
-- vim.keymap.set('n', '<leader>gp', ':Git pull<CR>', { desc = '[G]it [p]ull' })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = '[G]it [b]lame' })
-- vim.keymap.set('n', '<leader>gc', ':Git checkout ', { desc = '[G]it [c]heckout existing branch' })
-- vim.keymap.set('n', '<leader>gn', ':Git checkout -b ', { desc = '[G]it checkout [n]ew branch' })
