local M = {}

function M.setup()
    -- Use OSC52 in SSH/tmux sessions to avoid xclip/X11 display errors.
    local is_remote = vim.env.SSH_CONNECTION ~= nil or vim.env.TMUX ~= nil
    if not is_remote then
        return
    end

    local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
    if not ok then
        return
    end

    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = osc52.copy("+"),
            ["*"] = osc52.copy("*"),
        },
        paste = {
            ["+"] = osc52.paste("+"),
            ["*"] = osc52.paste("*"),
        },
    }
end

M.setup()

return M
