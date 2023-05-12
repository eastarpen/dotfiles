local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("glepnir/dashboard-nvim not installed!")
  return
end

db.setup {
  theme = "doom",
  config = {
    header = {
      [[]],
      [[   ███████╗ █████╗ ███████╗████████╗ █████╗ ██████╗ ██████╗ ███████╗███╗   ██╗ ]],
      [[   ██╔════╝██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║ ]],
      [[   █████╗  ███████║███████╗   ██║   ███████║██████╔╝██████╔╝█████╗  ██╔██╗ ██║ ]],
      [[   ██╔══╝  ██╔══██║╚════██║   ██║   ██╔══██║██╔══██╗██╔═══╝ ██╔══╝  ██║╚██╗██║ ]],
      [[   ███████╗██║  ██║███████║   ██║   ██║  ██║██║  ██║██║     ███████╗██║ ╚████║ ]],
      [[   ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ]],
      [[]],
      [[[ version : 1.0.0 ] ]]
    },
    center = {
      {
        icon = "  ",
        desc = "Recently files        <Leader>?       ",
        action = "Telescope oldfiles",
      },
      {
        icon = "  ",
        desc = "Search files          <Leader>sf   ",
        action = "Telescope find_files",
      },
      {
        icon = "  ",
        desc = "Search git files      <Leader>sf   ",
        action = "Telescope git_files",
      },
      {
        icon = "  ",
        desc = "Search word           <Leader>sw  ",
        action = "Telescope grep_string",
      },
      {
        icon = "  ",
        desc = "Search by grep        <Leader>sg  ",
        action = "Telescope live_grep",
      },
    },
    footer = {
      "",
      "",
      "github: https://github.com/eastarpen",
    },
    packages = { enable = true },
  }
}
