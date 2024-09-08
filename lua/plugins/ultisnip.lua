return {
    "SirVer/ultisnips",
    config = function()
        vim.g.UltiSnipsEditSplit = "vertical"
        vim.g.UltiSnipsSnippetDirectories = {'~/.config/nvim/lua/snippets'}

        vim.g.UltiSnipsExpandTrigger="<tab>"

        -- Conditionally set the jump backward trigger based on OS
        if vim.fn.has("mac") == 1 then
          vim.g.UltiSnipsJumpForwardTrigger = "<D-j>"  -- Example for macOS
          vim.g.UltiSnipsJumpBackwardTrigger = "^L "  -- Example for macOS
        else
          vim.g.UltiSnipsJumpForwardTrigger="<C-j>"
          vim.g.UltiSnipsJumpBackwardTrigger="<C-k>"
        end
    end,
}







