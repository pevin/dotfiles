-- Standalone plugins with less than 10 lines of config go here
return {
  {
    'vim-ruby/vim-ruby',
  },
  {
    'tpope/vim-rails',
  },
  {
    'tpope/vim-rake',
  },
  {
    'tpope/vim-endwise',
  },
  {
    'ThePrimeagen/vim-be-good',
  },
  {
    'schickling/vim-bufonly',
  },
  {
    -- Tmux & split window navigation
    'christoomey/vim-tmux-navigator',
  },
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
    opts = {
      win = {
        border = 'rounded',
      },
    },
  },
  -- {
  --   -- Autoclose parentheses, brackets, quotes, etc.
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   config = true,
  --   opts = {},
  -- },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'slim-template/vim-slim', -- Syntax highlighting for VIM
    ft = 'slim',
  },
}
