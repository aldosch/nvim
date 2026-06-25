return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    set_dark_mode = function()
      require("theme").apply_dark()
    end,
    set_light_mode = function()
      require("theme").apply_light()
    end,
    update_interval = 3000,
    fallback = "dark",
  },
}
