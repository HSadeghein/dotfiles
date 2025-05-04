return {
    "tzachar/local-highlight.nvim",
    config = function()
        require('local-highlight').setup({
            file_types = { 'python', 'cpp', 'h', 'hlsl' },
            disable_file_types = { 'tex' },
            hlgroup = 'LocalHighlight',
            cw_hlgroup = nil,
            insert_mode = false,
            min_match_len = 1,
            max_match_len = math.huge,
            highlight_single_match = true,
            animate = {
                enabled = false,
                easing = "linear",
                duration = {
                    step = 10,
                    total = 100,
                },
            },
            debounce_timeout = 200,
        })
    end,
}
