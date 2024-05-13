vim.g.mapleader = ","

local map = vim.keymap
map.set("i", "jk", "<ESC>")
map.set("n", ";", ":")

map.set("n", "<C-n>", ":GoTest<CR>")



local opts = { noremap = true, silent = true }

map.set("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
map.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)

map.set("n", "<C-H>", "<C-W><C-H>", opts)
map.set("n", "<C-J>", "<C-W><C-J>", opts)
map.set("n", "<C-K>", "<C-W><C-K>", opts)
map.set("n", "<C-L>", "<C-W><C-L>", opts)
