return {
  "mcauley-penney/visual-whitespace.nvim",
  config = function()
    require("visual-whitespace").setup({
      highlight = { link = "Visual" },
      space_char = "·",
      tab_char = "→",
      nl_char = "↲",
      cr_char = "←",
    })
  end,
}