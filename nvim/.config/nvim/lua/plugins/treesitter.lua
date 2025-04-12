return { -- Highlight, edit, and navigate codetree
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'lua',
      'ruby',
      'python',
      'javascript',
      'typescript',
      'vimdoc',
      'vim',
      'regex',
      'terraform',
      'sql',
      'dockerfile',
      'toml',
      'json',
      'java',
      'groovy',
      'go',
      'gitignore',
      'graphql',
      'yaml',
      'make',
      'cmake',
      'markdown',
      'markdown_inline',
      'bash',
      'tsx',
      'css',
      'html',
      'slim',
      'd2',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  config = function()
    require('nvim-treesitter').setup()
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.d2 = {
      install_info = {
        url = 'https://github.com/ravsii/tree-sitter-d2',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'd2',
    }

    -- we also need to tell neovim to use "d2" filetype on "*.d2" files, as well as
    -- token comment.
    -- ftplugin/autocmd is also an option.
    vim.filetype.add {
      extension = {
        d2 = function()
          return 'd2', function(bufnr)
            vim.bo[bufnr].commentstring = '# %s'
          end
        end,
      },
    }
  end,
}
