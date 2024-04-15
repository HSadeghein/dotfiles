require("telescope").setup {
  defaults = {
      preview = {
          treesitter = false
      },
      file_ignore_patterns = {
          "vendor/*",
            "%.lock",
            "__pycache__/*",
            "%.sqlite3",
            "%.ipynb",
            "node_modules/*",
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.svg",
            "%.otf",
            "%.ttf",
            ".git/",
            "%.webp",
            ".dart_tool/",
            ".github/",
            ".gradle/",
            ".idea/",
            ".settings/",
            ".vscode/",
            "__pycache__/",
            "build/",
            "env/",
            "gradle/",
            "node_modules/",
            "target/",
            "%.pdb",
            "%.dll",
            "%.class",
            "%.exe",
            "%.cache",
            "%.ico",
            "%.pdf",
            "%.dylib",
            "%.jar",
            "%.docx",
            "%.met",
            "smalljre_*/*",
            ".vale/",
            "%.burp",
            "%.mp4",
            "%.mkv",
            "%.rar",
            "%.zip",
            "%.7z",
            "%.tar",
            "%.bz2",
            "%.epub",
            "%.flac",
            "%.tar.gz",
            "%.storyboard",
            "%.plist",
            "%.xcworkspacedata",
            "%.vcproj.%",
            "build/*",
            "%.basic_geometry",
            "%.so",
            "%.evamodelstore",
            "SPIRV%-Cross/.*",
            "boost.*/.*",
            "external/"

      },
      vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },
    -- Your regular Telescope's options.
  },
  extensions = {
    recent_files = {
      -- This extension's options, see below.
      only_cwd = true
    },
    -- fzy_native = {
    --     override_generic_sorter = false,
    --     override_file_sorter = true,
    -- }
  }
}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', function()
    builtin.live_grep( { preview = { treesitter = false }, prompt_title = "no treesitter" })
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', function()
	builtin.buffers({sort_mru = true})
end)
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({only_sort_text = true})
end)
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})
-- vim.keymap.set('n', '<leader>fs', function() 
--         builtin.grep_string({ only_sort_text = true, search = vim.fn.input("Grep > " .. vim.fn.expand('<cword>'))})
-- end)

vim.keymap.set('n', 'gr', function()
  require('telescope.builtin').lsp_references({
    fname_width = 60,
    show_line = false,
  })
end, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
--
--
