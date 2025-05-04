return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "zbirenbaum/copilot.lua" },                   -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                            -- Only on MacOS or Linux
    opts = {

        -- See Configuration section for options
    },
    keys = {
        { "<leader>zc", ":CopilotChatToggle<CR>",  mode = "n" },
        { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v" },
        { "<leader>zf", ":CopilotChatFix<CR>",     mode = "v" },
    },
    -- See Commands section for default commands if you want to lazy load on them
}
