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
        ruby = {
          require('formatter.filetypes.ruby').rubocop,
        },
        ['*'] = {
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    }

    vim.api.nvim_create_autocmd('BufWritePost', {
      desc = 'Auto format on save',
      group = vim.api.nvim_create_augroup('_local_auto_format', { clear = true }),
      pattern = '*',
      command = ':FormatWrite',
    })
  end,
}
