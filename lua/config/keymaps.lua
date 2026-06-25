local keymap = vim.keymap.set

-- Smart selection that works with or without treesitter
keymap({ "n", "v" }, "<D-C-M-S-e>", function()
	require("utils.smart_selection").smart_expand()
end, { desc = "Expand selection (smart)" })

keymap("v", "<D-C-M-S-r>", function()
	require("utils.smart_selection").smart_reduce()
end, { desc = "Reduce selection (smart)" })

-- Jump to top/bottom of visual selection
-- keymap("v", "<M-Up>", "o`<", { desc = "Jump to top of selection" })
-- keymap("v", "<M-Down>", "o`>", { desc = "Jump to bottom of selection" })

-- Jump to top/bottom of current scope (treesitter-based)
keymap("n", "<M-Up>", function()
	require("utils.scope_navigation").jump_to_scope_start()
end, { desc = "Jump to top of scope" })

keymap("n", "<M-Down>", function()
	require("utils.scope_navigation").jump_to_scope_end()
end, { desc = "Jump to bottom of scope" })

-- Emacs-style line navigation
keymap({ "n", "v", "i" }, "<C-a>", "^", { desc = "Go to first non-blank character" })
keymap({ "n", "v", "i" }, "<C-e>", "<End>", { desc = "Go to end of line" })

-- Cmd+Left/Right with visual selection support
keymap({ "n", "i" }, "<D-Left>", "<Home>", { desc = "Go to start of line" })
keymap({ "n", "i" }, "<D-Right>", "<End>", { desc = "Go to end of line" })
keymap("v", "<D-Left>", "<Home>", { desc = "Extend selection to start of line" })
keymap("v", "<D-Right>", "<End>", { desc = "Extend selection to end of line" })
keymap({ "n", "i" }, "<D-S-Left>", "v<Home>", { desc = "Select to start of line" })
keymap({ "n", "i" }, "<D-S-Right>", "v<End>", { desc = "Select to end of line" })

-- Option+Left/Right for sibling node navigation (treesitter-based)
keymap("n", "<M-Left>", function()
	require("utils.scope_navigation").jump_to_prev_sibling()
end, { desc = "Jump to previous sibling node" })

keymap("n", "<M-Right>", function()
	require("utils.scope_navigation").jump_to_next_sibling()
end, { desc = "Jump to next sibling node" })

-- Keep visual mode as word navigation for now (can be updated later if needed)
keymap("v", "<M-Left>", "b", { desc = "Extend selection to previous word" })
keymap("v", "<M-Right>", "w", { desc = "Extend selection to next word" })
keymap("n", "<M-S-Left>", "vb", { desc = "Select to previous word" })
keymap("n", "<M-S-Right>", "vw", { desc = "Select to next word" })
keymap("i", "<M-S-Left>", "<C-o>vb", { desc = "Select to previous word" })
keymap("i", "<M-S-Right>", "<C-o>vw", { desc = "Select to next word" })

keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<leader>yy", "<cmd>Telescope neoclip<CR>", { desc = "Yank history" })

keymap("n", "<D-p>", "<cmd>Telescope find_files<CR>", { desc = "Quick file finder" })
keymap("n", "<D-g>", "<cmd>Telescope live_grep<CR>", { desc = "Text search (grep)" })
keymap("n", "<D-P>", "<cmd>Telescope commands<CR>", { desc = "Command palette" })
keymap("n", "<D-B>", "<cmd>Telescope buffers<CR>", { desc = "Quick buffer switch" })

keymap("n", "<D-b>", "<cmd>Oil<CR>", { desc = "Toggle file explorer" })
keymap("n", "<leader>b", "<cmd>Oil<CR>", { desc = "Toggle file explorer" })

keymap("n", "<leader>p", function()
	local path = vim.fn.expand("%:~")
	vim.fn.setreg("+", path)
	print("Copied: " .. path)
end, { desc = "Copy relative path to clipboard" })

keymap("n", "<leader>pp", function()
	local filename = vim.fn.expand("%:t")
	vim.fn.setreg("+", filename)
	print("Copied: " .. filename)
end, { desc = "Copy filename to clipboard" })

-- Comment toggling with Cmd+/
keymap("n", "<D-/>", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

keymap("i", "<D-/>", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

keymap("v", "<D-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {
	desc = "Toggle comment (selection)",
})

keymap("n", "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format document" })

keymap("v", "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format selection" })

keymap("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Open Copilot panel (alternative suggestions)" })

keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview git hunk" })
keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle git blame" })
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git diff" })
keymap("n", "]c", ":Gitsigns next_hunk<CR>", { desc = "Next git hunk" })
keymap("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "Previous git hunk" })

keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>sc", ":close<CR>", { desc = "Close split" })

keymap("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

keymap("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })
keymap("n", "<leader>m", ":messages<CR>", { desc = "Show message history" })

-- Toggle line numbers, ~ symbols, padding, and git signs
keymap("n", "<leader>ln", function()
	vim.opt.number = not vim.opt.number:get()
	local current_fillchars = vim.opt.fillchars:get()
	if current_fillchars.eob == " " then
		vim.opt.fillchars:append({ eob = "~" })
		vim.opt.signcolumn = "yes" -- Normal padding when line numbers shown
	else
		vim.opt.fillchars:append({ eob = " " })
		vim.opt.signcolumn = "no" -- No padding when line numbers hidden
	end
	-- Toggle git signs visibility
	require("gitsigns").toggle_signs()
end, { desc = "Toggle line numbers, ~ symbols, padding, and git signs" })

keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Delete operations that don't clutter system clipboard
-- Use black hole register for delete word operations
keymap("n", "daw", '"_daw', { desc = "Delete a word (no clipboard)" })
keymap("n", "diw", '"_diw', { desc = "Delete inner word (no clipboard)" })
keymap("n", "dW", '"_dW', { desc = "Delete WORD (no clipboard)" })
keymap("n", "daW", '"_daW', { desc = "Delete a WORD (no clipboard)" })
keymap("n", "diW", '"_diW', { desc = "Delete inner WORD (no clipboard)" })

-- Toggle minimal mode for focused writing
keymap("n", "<leader>mm", function()
	require("config.minimal_mode").toggle()
end, { desc = "Toggle minimal mode (no copilot/completions)" })
