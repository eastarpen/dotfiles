local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope not installed!")
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert",
    -- map keybindings
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      -- theme = "dropdown", 
    }
  },
  extensions = {
     -- 扩展插件配置
  },
})

