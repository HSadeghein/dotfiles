require('local-highlight').setup({
    file_types = {'python', 'cpp', 'hlsl', 'h', 'c'}, -- If this is given only attach to this
    -- OR attach to every filetype except:
    disable_file_types = {'tex'},
    hlgroup = 'Search',
    cw_hlgroup = 'Search',
    insert_mode = true,
})
