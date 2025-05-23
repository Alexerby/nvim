return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_viewer = 'zathura'
 end,

 keys = {
    {
      "<leader>li",
      "<cmd>VimtexTocToggle<cr>",
      desc = "Vimtex TOC",
    },
 }
}
