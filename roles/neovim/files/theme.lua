return {
    "paul-han-gh/tomorrow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
        require("tomorrow").setup(opts)
        vim.cmd[[colorscheme tomorrow-night]]
    end,
}
