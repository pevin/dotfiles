return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      'nvim-telescope/telescope-live-grep-args.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local actions = require 'telescope.actions'
    local telescope = require 'telescope'
    local lga_actions = require 'telescope-live-grep-args.actions'

    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = {
        theme = 'center',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.4,
          },
        },
        path_display = {
          'truncate',
        },
        mappings = {
          i = {
            ['<C-p>'] = actions.move_selection_previous, -- move to prev result
            ['<C-n>'] = actions.move_selection_next, -- move to next result
            ['<C-y>'] = actions.select_default, -- open file
            ['<C-e>'] = actions.select_default, -- open file alternative for easier reach
          },
          n = {
            ['<C-c>'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git/' },
          hidden = true,
        },
        grep_string = {
          file_ignore_patterns = { 'node_modules', '.git/' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '.git/' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        live_grep_args = {
          auto_quoting = true, -- enables -F and quoting
          mappings = { -- optional: add custom keymaps
            i = {
              ['<C-k>'] = lga_actions.quote_prompt(),
              ['<C-i>'] = lga_actions.quote_prompt { postfix = ' --iglob ' },
              ['<C-a>'] = lga_actions.to_fuzzy_refine,
            },
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    telescope.load_extension 'live_grep_args'

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>s?', builtin.help_tags, { desc = '[S]earch help (?)' })
    vim.keymap.set('n', '<leader>sh', builtin.find_files, { desc = '[S]earch files (h)' }) -- easy acess
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sy', builtin.builtin, { desc = '[S]earch select telescope (y)' })
    vim.keymap.set('n', '<leader>si', builtin.grep_string, { desc = '[S]earch current word (i)' })
    vim.keymap.set('n', '<leader>se', function()
      telescope.extensions.live_grep_args.live_grep_args {
        additional_args = function()
          return { '--hidden' }
        end,
      }
    end, { desc = '[S]earch by gr[E]p' })
    local live_grep_args_shortcuts = require 'telescope-live-grep-args.shortcuts'
    vim.keymap.set('v', '<leader>s', function()
      live_grep_args_shortcuts.grep_visual_selection {
        additional_args = function()
          return { '--hidden' }
        end,
      }
    end, { desc = '[S]earch selected' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
  end,
}
