-- -- --------------------------------------------------------------------------
-- General settings
-- -----------------------------------------------------------------------------

-- Leader
vim.g.mapleader = " "

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.ttyfast = true

-- Fix backspace indent
vim.opt.backspace = { "indent", "eol", "start" }

-- Mouse support
vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"

if vim.fn.has("gui_running") == 1 then
    if vim.fn.has("gui_mac") == 1 or vim.fn.has("gui_macvim") == 1 then
        vim.opt.guifont = "Menlo:h12"
        vim.opt.transparency = 7
    end
else
    if os.getenv("COLORTERM") == "gnome-terminal" then
        vim.opt.term = "gnome-256color"
    else
        if os.getenv("TERM") == "xterm" then
            vim.opt.term = "xterm-256color"
        end
    end
end

-- File navigation
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.cursorline = true

-- Tab
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- No swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Syntax
vim.cmd("syntax on")
vim.cmd("syntax enable")
vim.opt.re = 0

-- Better command line completion
vim.opt.wildmenu = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.shortmess:remove("S")

-- GF (Go to file)
vim.opt.path:append("$PWD/node_modules")
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Mappings
-- j/k/h/l to switch panes
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { noremap = true })

-- Terminal
vim.api.nvim_set_keymap("n", "T", ":term ++close<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>e", ":exit<CR>", { noremap = true, silent = true })

-- Copy/Paste/Cut
if vim.fn.has("unnamedplus") == 1 then
    vim.opt.clipboard = "unnamed,unnamedplus"
end
if vim.fn.has("macunix") == 1 then
    vim.api.nvim_set_keymap("v", "<C-x>", ":!pbcopy<CR>", { noremap = true })
    vim.api.nvim_set_keymap("v", "<C-c>", ":w !pbcopy<CR><CR>", { noremap = true })
end

vim.api.nvim_set_keymap("n", "<Leader>sh", ":!<Space>", { noremap = true })
