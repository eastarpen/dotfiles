local choosed = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. choosed)

if not status_ok then
  vim.notify("colorscheme \"" .. choosed .. "\" not found!")
  return
end
