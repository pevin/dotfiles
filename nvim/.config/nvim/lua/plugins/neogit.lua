return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
    'echasnovski/mini.pick', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}
    local open_neogit = function()
      neogit.open { kind = 'replace' }
    end
    vim.keymap.set('n', '<leader>gn', open_neogit, { desc = '[G]it show [N]eogit' })
    vim.keymap.set('n', '<leader>gd', '<cmd> DiffviewOpen <CR>', { desc = '[G]it [D]iff view open' })
    vim.keymap.set('n', '<leader>gx', '<cmd> DiffviewClose <CR>', { desc = '[G]it Diff view Close (x)' })
  end,
}
