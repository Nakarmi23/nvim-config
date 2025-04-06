vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- maintain position of cursor after appending below line
vim.keymap.set("n", "J", "mzJ`z")

-- keeps cursor at the middle of the screen when performing half page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps cursor at the middle of the screen when performing serch
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- exit insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")
vim.keymap.set("v", "kj", "<Esc>")

-- format current buffer
-- vim.keymap.set("n", "<leader>f", function()
--   vim.lsp.buf.format()
-- end)

-- find and replace all
vim.keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")

-- Navigate vim panes better
vim.keymap.set("n", '<C-k>', ':wincmd k<CR>')
vim.keymap.set("n", '<C-j>', ':wincmd j<CR>')
vim.keymap.set("n", '<C-h>', ':wincmd h<CR>')
vim.keymap.set("n", '<C-l>', ':wincmd l<CR>')

-- Resize Vim splits using Ctrl + Shift + hjkl
vim.keymap.set("n", "<C-M-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-j>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-k>", ":resize +2<CR>", { noremap = true, silent = true })

-- Simplyfy splits
-- Close window with Leader + q
vim.keymap.set('n', '<leader>q', ':close<CR>', { noremap = true, silent = true })
-- Open a new horizontal split with Leader + _
vim.keymap.set('n', '<leader>_', ':split<CR>', { noremap = true, silent = true })
-- Open a new vertical split with Leader + |
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { noremap = true, silent = true })

-- toggle tree
-- vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
