return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "MSc Economics",
        path = "~/Documents/vaults/MSc Econ",
      },
    },

  },
}
