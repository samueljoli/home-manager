require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    }
  }
})

local opts = { noremap = true, silent = true }

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'

-- vim.api.nvim_set_keymap('n', 'Z', ":Telescope find_files<cr>", opts)
-- vim.keymap.set('n', 'B', builtin.find_files, { desc = 'Something' })

print("telescope config loaded")

vim.keymap.set('n', '<leader>zf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', 'B', builtin.find_files, { desc = '[S]earch [F]iles' })
