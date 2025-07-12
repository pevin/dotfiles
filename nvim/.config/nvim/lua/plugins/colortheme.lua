return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1001,
  config = function()
    -- Optional config
    require('nightfox').setup {
      options = {
        transparent = false, -- set to true if you want a transparent background
        terminal_colors = true,
        styles = {
          comments = 'italic',
          keywords = 'bold',
          types = 'italic,bold',
        },
      },
    }

    -- Set your preferred colorscheme
    vim.cmd 'colorscheme nordfox' -- or nightfox, duskfox, dayfox, dawnfox, terafox, carbonfox
  end,
}
