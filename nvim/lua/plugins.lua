local packer = require("packer")

packer.startup(
  function(use)
   --------------------- Packer --------------------
   use 'wbthomason/packer.nvim'

   --------------------- Themes --------------------
   use("folke/tokyonight.nvim")

   use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

   --------------------- LSP --------------------
   use("williamboman/nvim-lsp-installer")
   use({ "neovim/nvim-lspconfig" })

   --------------------- Completion --------------------
   -- autopairs
   use("windwp/nvim-autopairs")
   -- nvim-cmp
   use("hrsh7th/nvim-cmp")
   -- snippet
   use("hrsh7th/vim-vsnip")
   use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
   use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
   use("hrsh7th/cmp-path") -- { name = 'path' }
   use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
end)

