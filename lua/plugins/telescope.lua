return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        -- Without ignore paths
        vim.keymap.set('n', '<leader>ffh', builtin.find_files, {})

        -- With ignore paths
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({
                file_ignore_patterns = { "node_modules" }
            })
        end, {})

    end
}

