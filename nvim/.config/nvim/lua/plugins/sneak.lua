return {
  'justinmk/vim-sneak',
  config = function()
    require('vim-sneak').setup {}
    vim.keymap.set('n', 'f', '<Plug>Sneak_s')
    vim.keymap.set('n', 'F', '<Plug>Sneak_S')
  end,
}
