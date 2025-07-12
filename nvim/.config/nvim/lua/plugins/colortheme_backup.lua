return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1001,
  config = function()
    require('rose-pine').setup {
      highlight_groups = {
        CurSearch = { fg = 'base', bg = 'leaf', inherit = false },
        Search = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },
        Cursor = { bg = 'rose' },
        IndentBlanklineContextChar = { fg = 'love' },

        NonText = { fg = 'highlight_high' },
        IblIndent = { fg = 'highlight_high' },
        IblWhitespace = { fg = 'highlight_high' },
        IblScope = { fg = 'foam' },

        TelescopeBorder = { fg = 'foam', bg = 'base' },
        TelescopeNormal = { fg = 'subtle', bg = 'base' },
        TelescopeSelection = { fg = 'text', bg = 'highlight_med' },
        TelescopeSelectionCaret = { fg = 'love', bg = 'highlight_med' },
        TelescopeMultiSelection = { fg = 'text', bg = 'highlight_high' },

        TelescopeTitle = { fg = 'base', bg = 'love' },
        TelescopePromptTitle = { fg = 'base', bg = 'pine' },
        TelescopePreviewTitle = { fg = 'base', bg = 'iris' },

        TelescopePromptNormal = { fg = 'text', bg = 'surface' },
        TelescopePromptBorder = { fg = 'surface', bg = 'surface' },

        -- WhichKey = { bg = 'base' },
        WhichKeyNormal = { fg = 'text', bg = 'base' },
        WhichKeyBorder = { fg = 'foam', bg = 'base' },

        NeoTreeCursorLine = { bg = 'highlight_med' },
      },
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
      palette = {
        -- Override the builtin palette per variant
        dawn = {
          gold = '#51735f',
          base = '#f0ecec',
          -- gold = '#c9964f',
          -- gold = '#b07427',
        },
      },
    }
    vim.cmd 'colorscheme rose-pine-dawn'
  end,
}
-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   priority = 1001,
--   config = function()
--     require('catppuccin').setup {
--       flavour = 'latte', -- latte, frappe, macchiato, mocha
--       background = { -- :h background
--         light = 'latte',
--         dark = 'macchiato',
--       },
--       transparent_background = false, -- disables setting the background color.
--       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--       term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--       dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = 'dark',
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--       },
--       no_italic = true, -- Force no italic
--       no_bold = true, -- Force no bold
--       no_underline = false, -- Force no underline
--       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { 'italic' }, -- Change the style of comments
--         conditionals = { 'italic' },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--         -- miscs = {}, -- Uncomment to turn off hard-coded styles
--       },
--       color_overrides = {
--         latte = {
--           base = '#faf4ed',
--           mantle = '#fffaf3',
--           crust = '#f2e9de',
--           surface0 = '#f4ede8',
--           surface1 = '#dfdad9',
--           surface2 = '#cecacd',
--           text = '#575279',
--           subtext1 = '#797593',
--           subtext0 = '#9893a5',
--           overlay2 = '#b4637a',
--           overlay1 = '#ea9d34',
--           -- overlay1 = '#ea9d34',
--           overlay0 = '#d7827e',
--           blue = '#286983',
--           sky = '#56949f',
--           lavender = '#907aa9',
--           red = '#b4637a',
--           -- peach = '#ea9d34',
--           peach = '#ea9d34',
--           yellow = '#d7827e',
--           green = '#56949f',
--           teal = '#286983',
--           mauve = '#907aa9',
--           flamingo = '#b4637a',
--           pink = '#d7827e',
--         },
--       },
--       custom_highlights = {},
--       default_integrations = true,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         alpha = true,
--         bufferline = true,
--         which_key = true,
--         vim_sneak = true,
--         notify = false,
--         mini = {
--           enabled = true,
--           indentscope_color = '',
--         },
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--       },
--     }
--
--     -- setup must be called before loading
--     vim.cmd.colorscheme 'catppuccin'
--   end,
-- }
