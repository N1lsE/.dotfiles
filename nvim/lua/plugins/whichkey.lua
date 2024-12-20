return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            preset = "helix",
            delay = 10000
        },
        keys = {
            {
                "<leader>g?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = true })
                end,
                desc = "Global Keymaps (which-key)",
            },
        },
    },
}
