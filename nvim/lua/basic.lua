-- file encoding
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- set scrolloff
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- set line number
vim.wo.number = true
vim.wo.relativenumber = true
-- hilight cursor line
vim.wo.cursorline = true
-- additional sign column
vim.wo.signcolumn = "yes"
-- how many character a line
vim.wo.colorcolumn = "80"
-- tab and space
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.bo.expandtab = true
-- >> and <<
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
-- command line height
vim.o.cmdheight = 1
-- aoto load when file be changed by other process
vim.o.autoread = true
vim.bo.autoread = true
vim.wo.wrap = false
-- set hidden
vim.o.hidden = true
vim.o.mouse = "a"
-- no backup and .swap
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- press in timeoutlen seen as "one key"
vim.o.timeoutlen = 300
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- choose another symbol displayed as space
vim.o.list = true
vim.o.listchars = "space:·"
--vim.o.listchars = "space:␣"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
