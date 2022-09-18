-- more information:
-- https://www.reddit.com/r/neovim/comments/qe8404/setting_up_custom_keybind_for_each_file_type/

-- thansk to @seblj for this wonderful function template
-- https://github.com/seblj/dotfiles/blob/6e3fc53daa46d520f777679d7e68b39289598360/nvim/lua/seblj/utils/init.lua#L113

local eval = vim.api.nvim_eval
local nnoremap = vim.keymap.nnoremap

local M = {}

M.run_term = function(command, ...)
    vim.cmd('term')
    local terminal_id = eval('b:terminal_job_id')
    vim.api.nvim_chan_send(terminal_id, string.format(command .. '\n\r', ...))

    -- nnoremap({ 'q', '<cmd>q<CR>', buffer = true })
    vim.cmd('stopinsert')
end

-- Save and execute file based on filetype
M.exec = function()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local isWin = vim.fn.has('win32') or vim.fn.has("win64")
    vim.cmd('silent! write')
    if ft == 'vim' or ft == 'lua' then
        vim.cmd('source %')
    elseif ft == 'python' then
        vim.cmd('sp')
        M.run_term('python3 %s', vim.fn.expand('%'))
    elseif ft == 'cpp' then
        vim.cmd('sp')
        local file = vim.fn.expand('%')
        local output = vim.fn.expand('%:t:r')
        local command = 'g++ -g %s -o %s && ./%s; rm %s'
        if isWin == 1 then
            output = output .. '.exe'
            command = 'g++ -g %s -o %s && %s; del %s'
        end
        M.run_term(command, file, output, output, output)
    end
end

return M
