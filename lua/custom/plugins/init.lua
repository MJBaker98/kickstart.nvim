-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'rebelot/kanagawa.nvim' },
  { 'kepano/flexoki' },
  { 'rose-pine/neovim' },
  { 'nvim-tree/nvim-web-devicons', opts = {} },
  { 'catppuccin/nvim' },
  { 'kepano/flexoki-neovim' },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        background = 'medium',
        transparent_background_level = 0,
        italics = true,
        disable_italic_comments = false,
        inlay_hints_background = 'dimmed',
        on_highlights = function(hl, palette)
          hl['@string.special.symbol.ruby'] = { link = '@field' }
          hl['DiagnosticUnderlineWarn'] = { undercurl = true, sp = palette.yellow }
        end,
      }
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        ['neo-tree'] = { event = 'BufWipeout' },
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'skim'
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1
      vim.g.vimtex_compiler_method = 'latexmk'
    end,
  },
  vim.lsp.config('ruff', {
    init_options = {
      settings = {
        -- Ruff language server settings go here
        configuration = '~/.config/ruff/ruff.toml',
      },
    },
  }),
  vim.lsp.enable 'ruff',
}
