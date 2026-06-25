local M = {}

-- Node types that we consider as scopes
local scope_node_types = {
	-- Blocks and statements
	"block",
	"statement_block",
	"compound_statement",
	"expression_statement",

	-- Functions
	"function_declaration",
	"function_definition",
	"method_declaration",
	"method_definition",
	"arrow_function",
	"function_expression",
	"function_item",
	"lambda",
	"lambda_expression",
	"anonymous_function",

	-- Classes and structures
	"class_declaration",
	"class_definition",
	"class_body",
	"struct_item",
	"impl_item",
	"interface_declaration",
	"type_declaration",
	"enum_declaration",
	"namespace_declaration",
	"module_declaration",

	-- Control flow
	"if_statement",
	"else_clause",
	"for_statement",
	"for_in_statement",
	"while_statement",
	"do_while_statement",
	"match_expression",
	"match_arm",
	"switch_statement",
	"case_statement",
	"ternary_expression",
	"conditional_expression",

	-- Data structures
	"array",
	"array_expression",
	"object",
	"object_expression",
	"object_pattern",
	"table_constructor",
	"dictionary",
	"list",
	"tuple",
	"set",
	"map",

	-- JSX/TSX elements
	"jsx_element",
	"jsx_self_closing_element",
	"jsx_fragment",
	"jsx_expression",

	-- HTML/Template elements
	"element",
	"template_element",
	"start_tag",
	"end_tag",

	-- String/Template literals
	"template_string",
	"string_fragment",
	"template_literal",

	-- Parenthesized expressions
	"parenthesized_expression",
	"arguments",
	"parameters",
	"formal_parameters",

	-- Other common scopes
	"do_statement",
	"try_statement",
	"catch_clause",
	"finally_clause",
	"closure_expression",
	"with_statement",
	"labeled_statement",

	-- Python specific
	"with_statement",
	"for_statement",
	"list_comprehension",
	"dictionary_comprehension",
	"set_comprehension",

	-- Go specific
	"select_statement",
	"type_spec",

	-- Rust specific
	"loop_expression",
	"for_expression",
	"if_expression",
	"block_expression",

	-- Comments (sometimes useful to jump to)
	"comment",
	"block_comment",
	"line_comment",
}

-- Check if a node type is considered a scope
local function is_scope_node(node)
	if not node then return false end

	local node_type = node:type()
	for _, scope_type in ipairs(scope_node_types) do
		if node_type == scope_type then
			return true
		end
	end
	return false
end

-- Check if a node spans multiple lines
local function is_multiline_node(node)
	if not node then return false end

	local start_row, _, end_row, _ = node:range()
	return end_row > start_row
end

-- Find the nearest parent scope node that spans multiple lines
local function find_scope_node(node)
	if not node then return nil end

	local current = node
	while current do
		if is_scope_node(current) and is_multiline_node(current) then
			return current
		end
		current = current:parent()
	end
	return nil
end

-- Jump to the start of the current scope
function M.jump_to_scope_start()
	local ts_utils = require("nvim-treesitter.ts_utils")

	-- Get the node at cursor
	local node = ts_utils.get_node_at_cursor()
	if not node then
		vim.notify("No treesitter node found", vim.log.levels.WARN)
		return
	end

	-- Find the scope node
	local scope = find_scope_node(node)
	if not scope then
		vim.notify("No scope found", vim.log.levels.WARN)
		return
	end

	-- Get the start position of the scope
	local start_row, start_col = scope:start()

	-- Move cursor to the start of the scope (add 1 because Neovim uses 1-indexed lines)
	vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
end

-- Jump to the end of the current scope
function M.jump_to_scope_end()
	local ts_utils = require("nvim-treesitter.ts_utils")

	-- Get the node at cursor
	local node = ts_utils.get_node_at_cursor()
	if not node then
		vim.notify("No treesitter node found", vim.log.levels.WARN)
		return
	end

	-- Find the scope node
	local scope = find_scope_node(node)
	if not scope then
		vim.notify("No scope found", vim.log.levels.WARN)
		return
	end

	-- Get the end position of the scope
	local end_row, end_col = scope:end_()

	-- Move cursor to the end of the scope (add 1 because Neovim uses 1-indexed lines)
	vim.api.nvim_win_set_cursor(0, {end_row + 1, end_col})
end

-- Jump to the previous sibling node
function M.jump_to_prev_sibling()
	local ts_utils = require("nvim-treesitter.ts_utils")

	-- Get the node at cursor
	local node = ts_utils.get_node_at_cursor()
	if not node then
		vim.notify("No treesitter node found", vim.log.levels.WARN)
		return
	end

	-- Try to find a previous sibling
	local prev_sibling = node:prev_named_sibling()

	-- If no sibling at current level, try the parent's previous sibling
	if not prev_sibling and node:parent() then
		prev_sibling = node:parent():prev_named_sibling()
	end

	if not prev_sibling then
		-- If still no sibling found, fall back to word navigation
		vim.cmd("normal! b")
		return
	end

	-- Get the start position of the previous sibling
	local start_row, start_col = prev_sibling:start()

	-- Move cursor to the start of the previous sibling
	vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
end

-- Jump to the next sibling node
function M.jump_to_next_sibling()
	local ts_utils = require("nvim-treesitter.ts_utils")

	-- Get the node at cursor
	local node = ts_utils.get_node_at_cursor()
	if not node then
		vim.notify("No treesitter node found", vim.log.levels.WARN)
		return
	end

	-- Try to find a next sibling
	local next_sibling = node:next_named_sibling()

	-- If no sibling at current level, try the parent's next sibling
	if not next_sibling and node:parent() then
		next_sibling = node:parent():next_named_sibling()
	end

	if not next_sibling then
		-- If still no sibling found, fall back to word navigation
		vim.cmd("normal! w")
		return
	end

	-- Get the start position of the next sibling
	local start_row, start_col = next_sibling:start()

	-- Move cursor to the start of the next sibling
	vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
end

return M
