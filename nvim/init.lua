-- basic settings
require('basic')

-- plugins settings
require('plugins')

-- color theme
require("colorscheme")

require("plugin-config.dashboard")

require("plugin-config.nvim-treesitter")

require("plugin-config.nvim-autopairs")
require("plugin-config.telescope")

--lsp 
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")

--compile 
require("coderunner")
