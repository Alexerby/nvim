-- TODO: Move the keybindings into pluggings as possible

-- Keymap Helper
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- General / Misc
-----------------------------------------------------------
map('i', 'jj', '<ESC>', opts)
map('n', '<leader>d', '<Cmd>nohlsearch<CR>', opts)
map('n', '<F4>', ':w<CR>:!python3 %<CR>', opts)

-----------------------------------------------------------
-- Neotree
-----------------------------------------------------------
map('n', '<leader>e', '<Cmd>Neotree toggle<CR>', opts)

-----------------------------------------------------------
-- LSP (Language Server Protocol)
-----------------------------------------------------------
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'dg', '<cmd>nohlsearch<CR>', opts)  -- Fixed incomplete command

-----------------------------------------------------------
-- Barbar Keymaps
-- Plugin: barbar.nvim
-----------------------------------------------------------

-- Navigation
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Reordering
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Go to specific buffer
for i = 1, 9 do
  map('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
end
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin / Unpin
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Sort buffers
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
