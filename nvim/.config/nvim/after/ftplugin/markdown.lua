vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true
