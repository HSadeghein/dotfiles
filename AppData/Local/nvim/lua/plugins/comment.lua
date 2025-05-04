return {
    'numToStr/Comment.nvim',
    opts = {
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
            -- line = '<C-_>', -- for other terminals like Alachrity
            line = '<C-/>', -- for other terminals like Alachrity
            block = 'gcc',
        },
        opleader = {
            line = '<C-/>',
            block = 'gcc',
        },
        extra = {
            above = 'gcO',
            below = 'gco',
            eol = 'gcA',
        },
        mappings = {
            basic = true,
            extra = true,
        },
        pre_hook = nil,
        post_hook = nil,
    },
    config = function(_, opts)
        require('Comment').setup(opts)
        local ft = require('Comment.ft')
        -- Set filetype comment strings
        ft.set('yaml', '#%s').set('javascript', { '//%s', '/*%s*/' })
        ft.set('hlsl', '//%s')
        ft.javascript = { '//%s', '/*%s*/' }
        ft.yaml = '#%s'
        ft({ 'go', 'rust' }, { '//%s', '/*%s*/' })
        ft({ 'toml', 'graphql' }, '#%s')
        ft.set('json', '//%s')
        -- Optionally set commentstring for json/hlsl globally
        -- vim.api.nvim_command('set commentstring=//%s')
    end,
}
