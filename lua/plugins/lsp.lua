-- TODO: Add looser settings to pyright
-- TODO: Remove LuaSnip as ultisnip is already in use?

return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- "j-hui/fidget.nvim",
    "quangnguyen30192/cmp-nvim-ultisnips",
    "nvimtools/none-ls.nvim",
  },

  config = function()
    -----------------------------------------------------------
    -- Setup imports
    -----------------------------------------------------------
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")

    -----------------------------------------------------------
    -- Global diagnostic configuration
    -----------------------------------------------------------
    vim.diagnostic.config({
      virtual_text = {
        prefix = '●',  -- Could be '■', '▶', '▎', '●'
        spacing = 2,
      },
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -----------------------------------------------------------
    -- LSP capabilities (for nvim-cmp integration)
    -----------------------------------------------------------
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -----------------------------------------------------------
    -- Mason and mason-lspconfig setup
    -----------------------------------------------------------
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "texlab",
      },

      handlers = {
        -- Default handler
        function(server_name)
          if server_name == "tsserver" then
            server_name = "ts_ls"
          end
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -------------------------------------------------------
        -- Custom LSP setups
        -------------------------------------------------------

        -- Pyright
        ["pyright"] = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "strict", -- or "off", "basic", "strict"
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                },
              },
            },
          })
        end,

        -- Zig LSP (zls)
        zls = function()
          lspconfig.zls.setup({
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
              zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
              },
            },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,

        -- Lua LSP
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = {
                    "bit", "vim", "it", "describe",
                    "before_each", "after_each"
                  },
                },
              },
            },
          })
        end,
      },
    })

    -----------------------------------------------------------
    -- Completion (nvim-cmp) setup
    -----------------------------------------------------------
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>']   = cmp.mapping.select_next_item(cmp_select),
        ['<CR>']    = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources(
        {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "ultisnips" },
        },
        {
          { name = "buffer" },
        }
      )
    })
  end
}
