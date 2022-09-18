local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("glepnir/dashboard-nvim not installed!")
    return
end

db.custom_footer = {
    "",
    "",
    "github: https://github.com/eastarpen",
}

db.custom_center = {
    {
        icon = "  ",
        desc = "Recently files     <C-r>       ",
        action = "Telescope oldfiles",
    },
    {
        icon = "  ",
        desc = "Find file          <Leader>f   ",
        action = "Telescope find_files",
    },
    {
        icon = "  ",
        desc = "Find text          <Leader>ff  ",
        action = "Telescope live_grep",
    },
}


db.custom_header = {
    [[]],
    [[   ███████╗ █████╗ ███████╗████████╗ █████╗ ██████╗ ██████╗ ███████╗███╗   ██╗ ]],
    [[   ██╔════╝██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║ ]],
    [[   █████╗  ███████║███████╗   ██║   ███████║██████╔╝██████╔╝█████╗  ██╔██╗ ██║ ]],
    [[   ██╔══╝  ██╔══██║╚════██║   ██║   ██╔══██║██╔══██╗██╔═══╝ ██╔══╝  ██║╚██╗██║ ]],
    [[   ███████╗██║  ██║███████║   ██║   ██║  ██║██║  ██║██║     ███████╗██║ ╚████║ ]],
    [[   ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ]],
    [[]],
    [[[ version : 1.0.0 ] ]]
}
