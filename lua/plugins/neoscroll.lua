return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing_function = nil,
      pre_hook = nil,
      post_hook = nil,
      performance_mode = false,
    })

    local neoscroll = require("neoscroll")

    vim.keymap.set("n", "<C-u>", function() neoscroll.scroll(-vim.wo.scroll, true, 250) end)
    vim.keymap.set("n", "<C-d>", function() neoscroll.scroll(vim.wo.scroll, true, 250) end)
    vim.keymap.set("n", "<C-b>", function() neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 450) end)
    vim.keymap.set("n", "<C-f>", function() neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 450) end)
    vim.keymap.set("n", "<C-y>", function() neoscroll.scroll(-0.10, false, 100) end)
    vim.keymap.set("n", "<C-e>", function() neoscroll.scroll(0.10, false, 100) end)
    vim.keymap.set("n", "zt", function() neoscroll.zt(250) end)
    vim.keymap.set("n", "zz", function() neoscroll.zz(250) end)
    vim.keymap.set("n", "zb", function() neoscroll.zb(250) end)
  end,
}