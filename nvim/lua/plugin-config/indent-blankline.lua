vim.cmd("highlight IndentBlanklineContextChar guifg=#4AA03C gui=nocombine")
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
}
