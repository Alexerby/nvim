return {
  require('lazy').setup({
    {
      'catppuccin/nvim',
      config = function()
        require('catppuccin').setup {
          transparent_background = true,
        }
      end
    },
    {
      'LazyVim/LazyVim',
      config = function()
        -- Assuming LazyVim uses the `colorscheme` option
        vim.cmd [[colorscheme catppuccin]]
      end
    }
  })
}
