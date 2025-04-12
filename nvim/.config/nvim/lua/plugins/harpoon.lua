return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      local finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end

        return require('telescope.finders').new_table {
          results = paths,
        }
      end
      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = finder(),
          previewer = false,
          sorter = require('telescope.config').values.generic_sorter {},
          layout_config = {
            height = 0.4,
            width = 0.5,
            prompt_position = 'top',
            preview_cutoff = 120,
          },
          attach_mappings = function(prompt_bufnr, map)
            map('i', '<C-d>', function()
              local state = require 'telescope.actions.state'
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_bufnr)

              table.remove(harpoon_files.items, selected_entry.index)
              current_picker:refresh(finder())
            end)
            return true
          end,
        })
        :find()
      -- require('telescope.pickers')
      --   .new({}, {
      --     prompt_title = 'Harpoon',
      --     finder = require('telescope.finders').new_table {
      --       results = file_paths,
      --     },
      --     previewer = conf.file_previewer {},
      --     sorter = conf.generic_sorter {},
      --   })
      --   :find()
    end

    vim.keymap.set('n', '<leader>he', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[H]arpoon m[E]nu' })
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd' })
    -- vim.keymap.set('n', '<C-e>', function()
    --   harpoon.ui:toggle_quick_menu(harpoon:list())
    -- end)

    vim.keymap.set('n', '<leader>hs', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>ht', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>hr', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hh', function()
      harpoon:list():prev()
    end, { desc = '[H]arpoon previous buffer(H)' })
    vim.keymap.set('n', '<leader>hl', function()
      harpoon:list():next()
    end, { desc = '[H]arpoon next buffer(L)' })
  end,
}
