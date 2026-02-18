-- Theme cycling with persistence (<leader>t to cycle, remembers last pick)

local themes = {
    "noctishc",             -- vibrant high contrast
    "modus_vivendi",        -- high contrast dark (WCAG AAA)
    "modus_operandi",       -- high contrast light (WCAG AAA)
    "gruvbox",
    "rose-pine",
}

local cache_file = vim.fn.stdpath("data") .. "/theme_choice"

local function load()
    local f = io.open(cache_file, "r")
    if f then
        local idx = tonumber(f:read("*a"))
        f:close()
        if idx and idx >= 1 and idx <= #themes then return idx end
    end
    return 1
end

local function save(idx)
    local f = io.open(cache_file, "w")
    if f then f:write(tostring(idx)); f:close() end
end

local current = load()

vim.keymap.set("n", "<leader>t", function()
    current = current % #themes + 1
    vim.cmd("colorscheme " .. themes[current])
    save(current)
    vim.schedule(function()
        vim.api.nvim_echo(
            {{"Theme [" .. current .. "/" .. #themes .. "]: " .. themes[current], "WarningMsg"}},
            true, {}
        )
    end)
end, { desc = "Cycle colorscheme" })

vim.cmd("colorscheme " .. themes[current])
