-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, desc = "Move text up" })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, desc = "Move text down" })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, desc = "Move to the window below" })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, desc = "Move to the window below" })
