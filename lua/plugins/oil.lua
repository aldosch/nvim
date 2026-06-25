return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-v>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["g."] = "actions.toggle_hidden",
			},
			view_options = {
				show_hidden = true,

				is_hidden_file = function(name, bufnr)
					return name:sub(1, 1) == "."
				end,

				is_always_hidden = function(name, bufnr)
					-- exact matches for common macOS stuff and patterns for wildcard cases
					local always = {
						[".DS_Store"] = true,
						[".AppleDouble"] = true,
						[".LSOverride"] = true,
						[".DocumentRevisions-V100"] = true,
						[".fseventsd"] = true,
						[".Spotlight-V100"] = true,
						[".TemporaryItems"] = true,
						[".Trashes"] = true,
						[".VolumeIcon.icns"] = true,
						[".com.apple.timemachine.donotpresent"] = true,
						[".AppleDB"] = true,
						[".AppleDesktop"] = true,
						["Network Trash Folder"] = true,
						["Temporary Items"] = true,
						[".apdisk"] = true,
						["Icon\r\r"] = true, -- Icon files with trailing \r\r
					}
					if always[name] then
						return true
					end
					if name:match("^%._") then
						return true
					end -- ._* (thumbnails/resource fork)
					return false
				end,
			},
		})
	end,
}

