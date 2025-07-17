return {
  'mhartington/formatter.nvim',
  config = function()
    require('formatter').setup {
      logging = true,
      log_level = vim.log.levels.WARN,

      filetype = {
        lua = {
          require('formatter.filetypes.lua').stylua,
        },
        javascript = {
          require('formatter.filetypes.javascript').prettier,
        },
        typescript = {
          require('formatter.filetypes.typescript').prettier,
        },
        typescriptreact = {
          require('formatter.filetypes.typescriptreact').prettier,
        },
        ruby = {
          require('formatter.filetypes.ruby').rubocop,
        },
        ['*'] = {
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    }

    vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>', { silent = true }) -- close current split window

    -- DISABLE AUTO FORMATTER
    -- vim.api.nvim_create_autocmd('BufWritePost', {
    --   desc = 'Auto format on save',
    --   group = vim.api.nvim_create_augroup('_local_auto_format', { clear = true }),
    --   pattern = '*',
    --   command = ':FormatWrite',
    -- })
  end,
}
