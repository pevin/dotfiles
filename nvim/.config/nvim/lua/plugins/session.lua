return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
-- return {
--   'stevearc/resession.nvim',
--   opts = {},
--   config = function()
--     local resession = require 'resession'
--     resession.setup {
--       autosave = {
--         enabled = true,
--         interval = 60,
--         notify = true,
--       },
--     }
--
--     vim.keymap.set('n', '<leader>is', resession.save, { desc = 'Sess[i]on [s]ave' })
--     vim.keymap.set('n', '<leader>il', resession.load, { desc = 'Sess[i]on [l]oad' })
--     vim.keymap.set('n', '<leader>id', resession.delete, { desc = 'Sess[i]on [d]elete' })
--
--     vim.api.nvim_create_autocmd('VimLeavePre', {
--       callback = function()
--         -- Always save a special session named "last"
--         resession.save 'last'
--       end,
--     })
--   end,
-- }
