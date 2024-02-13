-- require("telescope").setup {
--   defaults = {
--       preview = {
--           treesitter = false
--       },
--       file_ignore_patterns = {
--           "vendor/*",
--             "%.lock",
--             "__pycache__/*",
--             "%.sqlite3",
--             "%.ipynb",
--             "node_modules/*",
--             "%.jpg",
--             "%.jpeg",
--             "%.png",
--             "%.svg",
--             "%.otf",
--             "%.ttf",
--             ".git/",
--             "%.webp",
--             ".dart_tool/",
--             ".github/",
--             ".gradle/",
--             ".idea/",
--             ".settings/",
--             ".vscode/",
--             "__pycache__/",
--             "build/",
--             "env/",
--             "gradle/",
--             "node_modules/",
--             "target/",
--             "%.pdb",
--             "%.dll",
--             "%.class",
--             "%.exe",
--             "%.cache",
--             "%.ico",
--             "%.pdf",
--             "%.dylib",
--             "%.jar",
--             "%.docx",
--             "%.met",
--             "smalljre_*/*",
--             ".vale/",
--             "%.burp",
--             "%.mp4",
--             "%.mkv",
--             "%.rar",
--             "%.zip",
--             "%.7z",
--             "%.tar",
--             "%.bz2",
--             "%.epub",
--             "%.flac",
--             "%.tar.gz",
--             "%.storyboard",
--             "%.plist",
--             "%.xcworkspacedata",
--             "%.vcproj.%",
--             "build/*",
--             "%.basic_geometry",
--             "%.so",
--             "%.evamodelstore",
--
--       }
--     -- Your regular Telescope's options.
--   },
--   extensions = {
--     recent_files = {
--       -- This extension's options, see below.
--       only_cwd = true
--     },
--     -- fzy_native = {
--     --     override_generic_sorter = false,
--     --     override_file_sorter = true,
--     -- }
--   }
-- }
-- require('telescope').load_extension('fzf')
--
local present, telescope_setup = pcall(require, "telescope")
if not present then
  return
end

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end,
  }):sync()
end

local os = require("core.utils").os
local buffer_previewer_maker
local finder
if os == "Linux" or os == "Darwin" then
  -- Find the name of the fd binary file in the operating system.
  if vim.fn.filereadable("/bin/fdfind") == 1 or vim.fn.filereadable("/usr/bin/fdfind") == 1 then
    finder = "fdfind"
  else
    finder = "fd"
  end
  buffer_previewer_maker = new_maker
else
  finder = "fd"
  buffer_previewer_maker = nil
end

local telescope_config = {
  defaults = {
    preview = {
        treesitter = false
    },
    buffer_previewer_maker = buffer_previewer_maker,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    prompt_prefix = "   ",
    selection_caret = "󰋇 ",
  },
  pickers = {
    find_files = {
      find_command = { finder, "--type=file", "--follow", "--exclude=.git" },
    },
  },
  extensions = {},
}

if require("core.utils").is_plugin_installed("telescope-fzf-native.nvim") then
  telescope_config.extensions["fzf"] = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  }
  telescope_setup.load_extension("fzf")
end

if require("core.utils").is_plugin_installed("telescope_find_directories") then
  telescope_setup.load_extension("find_directories")
end

-- local config = require("user_settings")
-- if config.telescope then
--   for k, v in pairs(config.telescope) do
--     telescope_config[k] = v
--   end
-- end

telescope_setup.setup(telescope_config)

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
