return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
    end,
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end,                                    mode = "n", desc = "Harpoon add file" },
        { "<C-e>",     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, mode = "n", desc = "Harpoon quick menu" },
    },
}
