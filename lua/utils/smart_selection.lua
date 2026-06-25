local M = {}

-- Check if treesitter is available for current buffer
local function has_treesitter()
	local ok, ts = pcall(require, "nvim-treesitter.parsers")
	if not ok then
		return false
	end
	return ts.has_parser()
end

-- Fallback expand selection for non-treesitter files
local function fallback_expand()
	local mode = vim.api.nvim_get_mode().mode
	
	if mode == "n" then
		-- Start with current word
		vim.cmd("normal! viw")
	else
		-- In visual mode, expand selection
		local start_pos = vim.fn.getpos("'<")
		local end_pos = vim.fn.getpos("'>")
		local start_line, start_col = start_pos[2], start_pos[3]
		local end_line, end_col = end_pos[2], end_pos[3]
		
		-- Get current line content
		local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
		
		if #lines == 1 then
			-- Single line selection - expand to word boundaries, then line
			local line = lines[1]
			local expanded = false
			
			-- Try to expand to word boundaries
			local word_start = start_col
			local word_end = end_col
			
			while word_start > 1 and line:sub(word_start - 1, word_start - 1):match("[%w_]") do
				word_start = word_start - 1
				expanded = true
			end
			
			while word_end <= #line and line:sub(word_end, word_end):match("[%w_]") do
				word_end = word_end + 1
				expanded = true
			end
			
			if expanded and (word_start ~= start_col or word_end ~= end_col) then
				vim.api.nvim_buf_set_mark(0, "<", start_line, word_start - 1, {})
				vim.api.nvim_buf_set_mark(0, ">", end_line, word_end - 1, {})
				vim.cmd("normal! gv")
				return
			end
			
			-- Expand to whole line
			vim.cmd("normal! V")
		else
			-- Multi-line selection - expand by one line each direction
			local total_lines = vim.api.nvim_buf_line_count(0)
			if start_line > 1 or end_line < total_lines then
				local new_start = math.max(1, start_line - 1)
				local new_end = math.min(total_lines, end_line + 1)
				vim.api.nvim_buf_set_mark(0, "<", new_start, 0, {})
				vim.api.nvim_buf_set_mark(0, ">", new_end, 0, {})
				vim.cmd("normal! gv")
			end
		end
	end
end

-- Fallback reduce selection for non-treesitter files
local function fallback_reduce()
	local mode = vim.api.nvim_get_mode().mode
	if mode ~= "v" and mode ~= "V" and mode ~= "" then
		return
	end
	
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local start_line, start_col = start_pos[2], start_pos[3]
	local end_line, end_col = end_pos[2], end_pos[3]
	
	if mode == "V" then
		-- Line visual mode - try to go to character visual
		if start_line == end_line then
			-- Same line, select inner content
			vim.api.nvim_buf_set_mark(0, "<", start_line, 0, {})
			vim.api.nvim_buf_set_mark(0, ">", end_line, -1, {})
			vim.cmd("normal! gv")
		else
			-- Multiple lines, reduce by one line
			if start_line < end_line - 1 then
				vim.api.nvim_buf_set_mark(0, "<", start_line + 1, 0, {})
				vim.api.nvim_buf_set_mark(0, ">", end_line - 1, 0, {})
				vim.cmd("normal! gv")
			end
		end
	else
		-- Character visual mode - try to reduce selection
		if start_line == end_line then
			-- Same line - reduce by characters
			local new_start = math.min(start_col + 1, end_col - 1)
			local new_end = math.max(end_col - 1, start_col + 1)
			if new_start < new_end then
				vim.api.nvim_buf_set_mark(0, "<", start_line, new_start - 1, {})
				vim.api.nvim_buf_set_mark(0, ">", end_line, new_end - 1, {})
				vim.cmd("normal! gv")
			end
		else
			-- Multi-line - reduce by one line
			if start_line < end_line - 1 then
				vim.api.nvim_buf_set_mark(0, "<", start_line + 1, 0, {})
				vim.api.nvim_buf_set_mark(0, ">", end_line - 1, -1, {})
				vim.cmd("normal! gv")
			end
		end
	end
end

-- Smart expand that uses treesitter when available, fallback otherwise
function M.smart_expand()
	if has_treesitter() then
		local mode = vim.api.nvim_get_mode().mode
		if mode == "n" then
			require("nvim-treesitter.incremental_selection").init_selection()
		else
			require("nvim-treesitter.incremental_selection").node_incremental()
		end
	else
		fallback_expand()
	end
end

-- Smart reduce that uses treesitter when available, fallback otherwise
function M.smart_reduce()
	if has_treesitter() then
		local ok, err = pcall(function()
			require("nvim-treesitter.incremental_selection").node_decremental()
		end)
		if not ok then
			-- Fallback if treesitter reduce fails
			fallback_reduce()
		end
	else
		fallback_reduce()
	end
end

return M