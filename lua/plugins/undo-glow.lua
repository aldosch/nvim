return {
  "y3owk1n/undo-glow.nvim",
  config = function()
    require("undo-glow").setup({
      -- Optional configuration
      undo_glow_duration = 300,
      undo_glow_blend = 50,
    })
  end,
}