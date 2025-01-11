-- Custom keymaps

-- source the current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- execute current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")

-- execute current highlighted lines
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<leader>od", vim.cmd.Ex, { desc = "[o]pen [d]irectory" })
vim.keymap.set("n", "<leader>cd", vim.cmd.Rex, { desc = "[c]lose [d]irectory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted line(s) up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted line(s) down" })

vim.keymap.set("n", "<C-f>", "<C-u>zz", { desc = "scroll up half a page" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down half a page" })
vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor in middle of the screen when going through search terms" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor in middle of the screen when going through search terms" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "keep copied text in register when pasting on top of other text" })

vim.keymap.set("n", "<leader>sh", vim.cmd.vsp, { desc = "[s]plit window [h]orizontally" })
vim.keymap.set("n", "<leader>sv", vim.cmd.sp, { desc = "[s]plit window [v]ertically" })

vim.keymap.set("n", "<leader>dt", vim.diagnostic.setloclist, { desc = "toggle diagnostics" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "next diagnostic" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })

-- :cdo <something> (can be used to do something to each item in the quickfix list)
vim.keymap.set("n", "<leader>qu", vim.diagnostic.setqflist, { desc = "update quickfix list with diagnostics" })
vim.keymap.set("n", "<leader>qo", vim.cmd.copen, { desc = "open quick fix" })
vim.keymap.set("n", "<leader>qc", vim.cmd.cclose, { desc = "close quick fix" })
vim.keymap.set("n", "<leader>qn", vim.cmd.cnext, { desc = "next quick fix" })
vim.keymap.set("n", "<leader>qp", vim.cmd.cprev, { desc = "previous quick fix" })

-- These mappings control the size of splits (height/width)
vim.keymap.set("n", "<M-]>", "<c-w>5<", { desc = "make split bigger horizontally" })
vim.keymap.set("n", "<M-[>", "<c-w>5>", { desc = "make split small horizontally" })
vim.keymap.set("n", "<M-t>", "<C-W>+", { desc = "make split bigger vertically" })
vim.keymap.set("n", "<M-s>", "<C-W>-", { desc = "make split small vertically" })

-- vim terminal
-- Ctrl + d (close terminal)
vim.keymap.set("n", "<leader>ot", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 8)
end, { desc = "[o]pen [t]erminal" })
-- return to normal mode when in terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
