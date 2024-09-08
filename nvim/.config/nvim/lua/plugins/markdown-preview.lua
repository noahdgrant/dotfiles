return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    keys = {
        { "<leader>mp", ":MarkdownPreviewToggle<CR>", desc = "toggle [m]arkdown [p]review" },
        { "<leader>op", ":MarkdownPreview<CR>",       desc = "toggle [m]arkdown [p]review" },
    },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
        vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle", { desc = "toggle [m]arkdown [p]review" })
    end,
}
