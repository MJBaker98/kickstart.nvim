vim.pack.add { 'https://github.com/folke/persistence.nvim.git' }
local persistence = require 'persistence'
persistence.setup {}
vim.keymap.set('n', '<leader>ps', function() persistence.load() end)
vim.keymap.set('n', '<leader>pS', function() persistence.select() end)
vim.keymap.set('n', '<leader>pl', function() persistence.load { last = true } end)
vim.keymap.set('n', '<leader>pd', function() persistence.stop() end)

local starter = require 'mini.starter'

vim.pack.add { 'https://github.com/nvim-telescope/telescope-file-browser.nvim' }

starter.setup {
  -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
  -- started with intent to show something else.
  autoopen = true,

  -- Whether to evaluate action of single active item
  evaluate_single = false,

  -- Items to be displayed. Should be an array with the following elements:
  -- - Item: table with <action>, <name>, and <section> keys.
  -- - Function: should return one of these three categories.
  -- - Array: elements of these three types (i.e. item, array, function).
  -- If `nil` (default), default items will be used (see |mini.starter|).
  items = {
    {
      name = 'Restore last session',
      action = [[lua require("persistence").load()]],
      section = 'Sessions',
    },
    {
      name = 'Select session',
      action = [[lua require("persistence").select()]],
      section = 'Sessions',
    },
    starter.sections.builtin_actions(),
    starter.sections.recent_files(3, false),
    -- Use this if you set up 'mini.sessions'
    starter.sections.telescope(),
  },

  -- Array  of functions to be applied consecutively to initial content.
  -- Each function should take and return content for 'Starter' buffer (see
  -- |mini.starter| and |MiniStarter.content| for more details).
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Sessions', 'Builtin actions' }),
    starter.gen_hook.padding(3, 2),
    starter.gen_hook.aligning('center', 'center'),
  },

  -- Header to be displayed before items. Converted to single string via
  -- `tostring` (use `\n` to display several lines). If function, it is
  -- evaluated first. If `nil` (default), polite greeting will be used.
  header = os.date(),

  -- Footer to be displayed after items. Converted to single string via
  -- `tostring` (use `\n` to display several lines). If function, it is
  -- evaluated first. If `nil` (default), default usage help will be shown.
  footer = ' ',

  -- Characters to update query. Each character will have special buffer
  -- mapping overriding your global ones. Be careful to not add `:` as it
  -- allows you to go into command mode.
  query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',

  -- Whether to disable showing non-error feedback
  silent = false,
}

---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

--- ################### Flash
vim.pack.add { gh 'folke/flash.nvim' }
require('flash').setup {}

vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash treesitter' })
vim.keymap.set({ 'o' }, 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
vim.keymap.set({ 'c' }, '<c-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })

--- ################### Grug far
vim.pack.add { gh 'MagicDuck/grug-far.nvim' }
require('grug-far').setup {}
vim.keymap.set({ 'v', 'n', 'o' }, '<leader>sr', function() require('grug-far').open() end, { desc = 'Search & Replace' })

vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
}
require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
