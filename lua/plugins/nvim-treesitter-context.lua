return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = "nvim-treesitter/nvim-treesitter",
  enabled = false, -- Disable the plugin entirely
  config = function()
    require("treesitter-context").setup({
      enable = false,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = false,
      multiline_threshold = 20,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
      on_attach = nil,
    })

    -- Key mappings
    vim.keymap.set("n", "[c", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { silent = true, desc = "Go to context" })
  end,
}