return {
  'schickling/vim-bufonly',
  config = function()
    require('vim-bufonly').setup {}
    vim.keymap.set('n', '<leader>bx', '<cmd> BufOnly<CR>', { desc = 'Close all other buffers' })
  end,
}
