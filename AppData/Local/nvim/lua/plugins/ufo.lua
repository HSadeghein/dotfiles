return
{
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
        require('ufo').setup(
            {
                open_fold_hl_timeout = 0,
                close_fold_kinds = {},
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'lsp', 'indent' }
                end,
            }
        )
    end,
}
