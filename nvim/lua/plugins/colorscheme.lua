-- Neovim theme
-- Uncomment the theme that you want to use
return {
    --    {
    --        "rebelot/kanagawa.nvim",
    --        priority = 1000,
    --        config = function()
    --            vim.cmd.colorscheme("kanagawa-wave")
    --        end,
    --    },
    {
        -- Theme inspired by Atom
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("onedark")
        end,
    },
    -- {
    -- 	"rose-pine/neovim",
    -- 	name = "rose-pine",
    -- 	priority = 1000,
    -- 	config = function()
    -- 		require("rose-pine").setup({
    -- 			styles = {
    -- 				italic = false,
    -- 			},
    -- 		})
    -- 		-- vim.cmd.colorscheme("rose-pine-main")
    -- 		vim.cmd.colorscheme("rose-pine-moon")
    -- 		-- vim.cmd.colorscheme("rose-pine-dawn")
    -- 	end,
    -- },
}
