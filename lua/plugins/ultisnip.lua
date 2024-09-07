return {
    "SirVer/ultisnips",
    config = function()
        vim.g.UltiSnipsEditSplit = "vertical"
        vim.g.UltiSnipsSnippetDirectories = {'~/.config/nvim/lua/snippets'}

        vim.g.UltiSnipsExpandTrigger="<tab>"
        vim.g.UltiSnipsJumpForwardTrigger="<D-j>"
        vim.g.UltiSnipsJumpBackwardTrigger=""
    end,
}







