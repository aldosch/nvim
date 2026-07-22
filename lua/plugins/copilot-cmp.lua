return {
  "zbirenbaum/copilot-cmp",
  -- Lazy-load on real editing events. Without a trigger this plugin loads
  -- eagerly at startup and drags copilot.lua (its dependency) in with it,
  -- spawning the Copilot LSP node process even in headless mode. That process
  -- never shuts down cleanly on nvim 0.12, which hangs `+Lazy! sync +qa`.
  event = { "InsertEnter", "LspAttach" },
  -- Never load in headless mode (no UIs attached), so plugin syncs/CI runs
  -- never start the Copilot language server.
  cond = function()
    return #vim.api.nvim_list_uis() > 0
  end,
  dependencies = {
    "zbirenbaum/copilot.lua",
  },
  config = function()
    require("copilot_cmp").setup()
  end,
}
