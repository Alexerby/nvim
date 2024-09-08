-- return {
--   require('lazy').setup({
--     {
--       'catppuccin/nvim',
--       name = 'catppuccin', -- ensure the name is defined for proper referencing
--       config = function()
--         require('catppuccin').setup {
--           transparent_background = true,
--         }
--       end
--     },
--     {
--       'LazyVim/LazyVim',
--       dependencies = { 'catppuccin/nvim' }, -- ensure LazyVim waits for catppuccin to load
--       config = function()
--         vim.cmd.colorscheme('catppuccin') -- use proper lua function for colorscheme
--       end
--     }
--   })
-- }

return {
{
  "catppuccin/nvim", name = "catppuccin", priority = 1000,
  config = function()
    require('catppuccin').setup {
      transparent_background = true,
      vim.cmd.colorscheme('catppuccin') -- use proper lua function for colorscheme
    }
  end
}

}
