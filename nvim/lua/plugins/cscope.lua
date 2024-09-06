return {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
        "folke/which-key.nvim",  -- optional [for whichkey hints]
        --        "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
        "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
    },
    config = function()
        require("cscope_maps").setup()
    end,
}
