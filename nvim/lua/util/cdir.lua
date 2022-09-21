M = {}

M.croot = function ()
    local cur_dir = vim.fn.expand('%:p:h')
    vim.cmd("cd " .. cur_dir)
end

return M
