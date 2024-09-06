-- Neovim init file

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Have to have before require("lazy") so that keymaps are set up correctly for plugins
require("core.keymaps")
require("core.options")

require("lazy").setup("plugins", {
    change_detection = {
        notify = false,
    },
})
