-----------------------------------------------------------
-- General Options
-----------------------------------------------------------
vim.opt.guicursor = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 1

-----------------------------------------------------------
-- Spell Check
-----------------------------------------------------------
vim.opt.spell = true
vim.opt.spelllang = { "en_gb" }

-----------------------------------------------------------
-- UI Settings
-----------------------------------------------------------
vim.o.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true

-----------------------------------------------------------
-- Indentation
-----------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.expandtab = true

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------
-- Disable Treesitter highlighting for LaTeX (.tex) files
-- as Vimtex handles it

local tex_group = vim.api.nvim_create_augroup("MyTexAutocmds", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = tex_group,
  pattern = "tex",
  command = "TSDisable highlight",
})
