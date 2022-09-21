local packer = require("packer")

packer.startup(
  function(use)
   --------------------- Packer --------------------
   use 'wbthomason/packer.nvim'

   --------------------- Themes --------------------
   use("folke/tokyonight.nvim")

   --------------------- Dashboard --------------------
    use("glepnir/dashboard-nvim")

   --------------------- Fuzzy find --------------------
   -- Telescope
   -- after install, run :checkhealth telescope to install ripgrep and fd
   -- project addresses are below
   -- https://github.com/BurntSushi/ripgrep#installation
   -- https://github.com/sharkdp/fd#installation
   use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

   use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

   --------------------- LSP --------------------
   use("williamboman/nvim-lsp-installer")
   use({ "neovim/nvim-lspconfig" })

   --------------------- Completion --------------------
   -- autopairs
   use("windwp/nvim-autopairs")
   -- nvim-cmp
   use("hrsh7th/nvim-cmp")
   use("hrsh7th/cmp-vsnip")
   -- snippet
   use("hrsh7th/vim-vsnip")
   use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
   use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
   use("hrsh7th/cmp-path") -- { name = 'path' }
   use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
end)

