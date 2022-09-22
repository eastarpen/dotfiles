vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
-- key binds options
local opt = {noremap = true, silent = true }

local pluginKeys = {}

map('n', '<leader>gh', ':help <C-r><C-w><CR>', opt)
-- Indent file
map('n', '<leader>i', 'gg=G', opt)
-- For <C-r> used for telescope(recent files), map 'U' to "undo undo"
map('n', 'U', '<C-r>', opt)

map('n', 'cr', '<cmd>lua require("util.cdir").croot()<cr>', opt)

-------------------------  Window Navigation  ---------------------------------
-- about tab
map('n', '<C-t>', ':tabedit<CR>', opt)
-- Next tab
map('n', '<Tab>', 'gt', opt)
-- Previous tab
map('n', '<S-TAB>', 'gT', opt)

-- screeen split
-- Resize all splits
map('n', '<leader>=', '<C-w>=', opt)
-- screen split
map('n', 'sj', '<cmd>set splitbelow<CR>:sp<CR>', opt)
map('n', 'sk', '<cmd>set nosplitbelow<CR>:sp<CR>', opt)
map('n', 'sl', '<cmd>set splitright<CR>:vsp<CR>', opt)
map('n', 'sh', '<cmd>set nosplitright<CR>:vsp<CR>', opt)
-- Navigate split
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-l>', '<C-w>l', opt)
-- resize split **Not perfect** 
map('n', '<up>'   , '<cmd>res +2<CR>'         , opt)
map('n', '<down>' , '<cmd>res -2<CR>'         , opt)
map('n', '<left>' , '<cmd>vertical res -2<CR>', opt)
map('n', '<right>', '<cmd>vertical res +2<CR>', opt)


-------------------------  Telescope  -----------------------------------------
-- find file
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>ff", ":Telescope live_grep<CR>", opt)
map("n", "<C-r>", ":Telescope oldfiles<CR>", opt)
-- select list
pluginKeys.telescopeList = {
    i = {
        -- up
        ["<C-j>"] = "move_selection_next",
        -- down
        ["<C-k>"] = "move_selection_previous",
        -- history
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- close
        ["<C-c>"] = "close",
        -- up and down in preview window
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

-------------------------  CodeRunner  ----------------------------------------
local runner = "require('coderunner')"
map("n", ",r", "<cmd>lua " .. runner ..".exec()<cr>", opt)
map("n", ",d", "<cmd>lua " .. runner ..".debug()<cr>", opt)
map("n", "<leader>d", ":vsplit<CR>:e data.in<CR>ggdG", opt)

-------------------------  Nvim LSP  ------------------------------------------

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gE", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "ge", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
end

-------------------------  Nvim-cmp  ------------------------------------------
-- use for snippet jump
local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

pluginKeys.cmp = function(cmp)
    return {
        -- snippet jump
        ['<Tab>'] = cmp.mapping(
            function (fallback)
                --if vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                --else
                    --fallback()
                --end
            end, {"i", "s"}
        ),
        ['<S-Tab>'] = cmp.mapping(
            function (fallback)
                --if vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                --end
            end, {"i", "s"}
        ),
        -- show and close completion window
        ['<C-Space>'] = cmp.mapping(
        function (fallback)
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end, {'i', 'c'}
        ),
        -- next
        ["<C-j>"] = cmp.mapping(
        cmp.mapping.select_next_item(), {'i', 'c'}
        ),
        -- previous
        ["<C-k>"] = cmp.mapping(
        cmp.mapping.select_prev_item(), {'i', 'c'}
        ),
        -- confirm
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- scroll window
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end

return pluginKeys
