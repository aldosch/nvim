return {
  "ray-x/sad.nvim",
  dependencies = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  config = function()
    require("sad").setup({
      diff = "diff", -- you can use diff binary or use diff-so-fancy/delta
      ls_file = "rg", -- Use ripgrep from PATH
      exact = false, -- exact match
      vsplit = false, -- split sad window vertically
      height_ratio = 0.6,
      width_ratio = 0.6,
    })
  end,
}