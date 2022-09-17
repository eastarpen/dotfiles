local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("nvim-treesitter not found!")
    return
end

treesitter.setup({
  -- install language parser
  -- :TSInstallInfo for language supported
  ensure_installed = { "cpp", "c", "vim", "python"},
  -- highlight settings
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
