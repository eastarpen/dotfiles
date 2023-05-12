-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false
vim.o.wrap = false

vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.opt.shiftwidth = 4
vim.o.shiftround = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.autoread = true
vim.o.scrolloff = 8

vim.cmd([[
    let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
    \      '+': '/mnt/c/Windows/system32/clip.exe',
    \      '*': '/mnt/c/Windows/system32/clip.exe',
    \    },
    \   'paste': {
    \      '+': '/mnt/c/Windows/system32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \      '*': '/mnt/c/Windows/system32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
    \ }

]])
