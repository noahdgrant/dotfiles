-- Custom keymaps

local set = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

set("n", "<leader>od", vim.cmd.Ex, { desc = "[o]pen [d]irectory" })
set("n", "<leader>cd", vim.cmd.Rex, { desc = "[c]lose [d]irectory" })

set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted line(s) up" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted line(s) down" })

set("n", "J", "mzJ'z", { desc = "keep cursor at the beginning of line when appending to the end" })
set("n", "<C-f>", "<C-u>zz", { desc = "scroll up half a page" })
set("n", "<C-d>", "<C-d>zz", { desc = "scroll down half a page" })
set("n", "n", "nzzzv", { desc = "keep cursor in middle of the screen when going through search terms" })
set("n", "N", "Nzzzv", { desc = "keep cursor in middle of the screen when going through search terms" })

set("x", "<leader>p", '"_dP', { desc = "keep copied text in register when pasting on top of other text" })

set("n", "<leader>qf", vim.cmd.copen, { desc = "open [q]uick [f]ix" })
-- set("n", "<C-n>", vim.cmd.cnext, {desc = "next quick fix"})
-- set("n", "<C-p>", vim.cmd.cprev, {desc = "previous quick fix"})

set("n", "<leader>sh", vim.cmd.vsp, { desc = "[s]plit window [h]orizontally" })
set("n", "<leader>sv", vim.cmd.sp, { desc = "[s]plit window [v]ertically" })

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
set("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnastic" })

-- These mappings control the size of splits (height/width)
set("n", "<M-]>", "<c-w>5<")
set("n", "<M-[>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")
