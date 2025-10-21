return {
  { 'rebelot/kanagawa.nvim' },
  { 'kepano/flexoki' },
  { 'rose-pine/neovim' },
  { 'nvim-tree/nvim-web-devicons', opts = {} },
  { 'catppuccin/nvim' },
  { 'kepano/flexoki-neovim' },
  { 'sainnhe/gruvbox-material' },
  { 'scottmckendry/cyberdream.nvim' },
  { 'slugbyte/lackluster.nvim' },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 900, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        background = 'hard',
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
    'everviolet/nvim',
    name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'green',
      },
      editor = {
        transparent_background = false,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          solid_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
    },
  },
}
