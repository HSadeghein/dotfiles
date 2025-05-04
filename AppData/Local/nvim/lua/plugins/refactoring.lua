return {
  "ThePrimeagen/refactoring.nvim",
  config = function()
    require('refactoring').setup({
      prompt_func_return_type = {
        cpp = true,
        c = true
      },
      prompt_func_param_type = {
        cpp = true,
        c = true
      },
    })
  end,
}
