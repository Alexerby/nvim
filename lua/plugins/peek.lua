return {
  -- Requires Deno: https://deno.com
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",

  config = function()
    local peek = require("peek")

    -- Main setup
    peek.setup({
      auto_load = true,          -- auto preview on entering markdown buffer
      close_on_bdelete = true,   -- close preview window on buffer delete
      syntax = true,             -- enable syntax highlighting (may impact performance)
      theme = "dark",            -- 'dark' or 'light'
      update_on_change = true,
      app = "webview",           -- 'webview', 'browser', or custom command
      filetype = { "markdown" }, -- filetypes to recognize as markdown

      -- Throttling for large files
      throttle_at = 200000,      -- start throttling at this file size (bytes)
      throttle_time = "auto",    -- minimum delay before next render (ms)
    })

    -- User commands
    vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
    vim.api.nvim_create_user_command("PeekClose", peek.close, {})
  end,
}
