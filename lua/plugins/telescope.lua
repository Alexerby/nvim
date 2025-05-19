return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    -----------------------------------------------------------
    -- Setup telescope
    -----------------------------------------------------------
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({})

    -----------------------------------------------------------
    -- Key mappings
    -----------------------------------------------------------
    local keymap = vim.keymap.set
    local opts = {}

    -- General search
    keymap('n', '<leader>fg', builtin.live_grep, opts)         -- TODO: Add args for grep options
    keymap('n', '<leader>fs', builtin.grep_string, opts)
    keymap('n', '<leader>fb', builtin.buffers, opts)
    keymap('n', '<leader>fh', builtin.help_tags, opts)
    keymap('n', '<leader>fr', builtin.lsp_references, opts)

    -- File search (non-filtered)
    keymap('n', '<leader>ffh', builtin.find_files, opts)

    -- File search (ignores node_modules)
    keymap('n', '<leader>ff', function()
      builtin.find_files({
        file_ignore_patterns = { "node_modules" },
      })
    end, opts)
  end,
}
