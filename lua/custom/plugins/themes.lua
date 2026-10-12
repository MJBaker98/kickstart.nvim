vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }
vim.pack.add { { src = 'https://github.com/folke/tokyonight.nvim', name = 'tokyonight' } }
vim.pack.add { { src = 'https://github.com/savq/melange-nvim', name = 'melange' } }
vim.pack.add { { src = 'https://github.com/Mofiqul/dracula.nvim', name = 'dracula' } }
vim.pack.add { { src = 'https://github.com/miikanissi/modus-themes.nvim'}}

require("catppuccin").setup{}
require("tokyonight").setup{}
-- require("melange").setup{}
require("dracula").setup{}
require("modus-themes").setup{}

