-- Auto-sourcing disabled due to lazy.nvim incompatibility
-- You'll need to restart nvim to reload config changes
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = vim.fn.expand("~/.config/nvim/init.lua"),
--   command = "source %",
--   desc = "Reload config on save"
-- })

-- Visual feedback
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
	desc = "Highlight yanked text",
})

-- Auto-hide informational messages after 3 seconds
local function auto_clear_message()
	vim.defer_fn(function()
		-- Only clear if the last message wasn't an error
		local last_msg = vim.fn.execute("messages"):match("[^\n]*$")
		if last_msg and not last_msg:match("^E%d+:") and not last_msg:match("Error") then
			vim.cmd("echon ''")
		end
	end, 3000)
end

-- Clear messages after various events
vim.api.nvim_create_autocmd({ "BufWritePost", "CmdlineLeave", "LspNotify" }, {
	callback = auto_clear_message,
	desc = "Auto-hide informational messages after 3 seconds",
})

-- File management
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
	desc = "Remove trailing whitespace",
})

-- Filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.foldlevel = 99
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
	desc = "Set markdown fold level and indent to 2 spaces",
})
