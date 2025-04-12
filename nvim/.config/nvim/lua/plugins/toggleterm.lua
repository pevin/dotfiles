return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      shade_terminals = false,
      size = function(term)
        if term.direction == 'horizontal' then
          return 20
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.35
        end
      end,
    }
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end
    exitTerm = function()
      vim.cmd ':ToggleTerm'
    end

    vim.keymap.set('t', '<esc><esc>', exitTerm)

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    -- vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>mv', ':ToggleTerm direction=vertical<CR>', { desc = 'Toggle ter[M]inal [V]ertically' })
    vim.keymap.set('n', '<leader>mh', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle ter[M]inal [H]orizontally' })
  end,
}
