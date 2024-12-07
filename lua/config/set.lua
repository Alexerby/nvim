vim.opt.guicursor = ""
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true

vim.o.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.expandtab = true
vim.opt.conceallevel = 1

vim.opt.clipboard = "unnamedplus"

-- Create an autocmd group to avoid duplication
vim.api.nvim_create_augroup("MyTexAutocmds", { clear = true })

-- Define the autocmd for .tex files
vim.api.nvim_create_autocmd("FileType", {
  group = "MyTexAutocmds",
  pattern = "tex",
  command = "TSDisable highlight"
})
