return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "zapling/mason-conform.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "emmet_ls" },
      automatic_installation = true,
    })
    require("mason-conform").setup({
      ensure_installed = { "stylua", "prettier" },
      automatic_installation = true,
    })
  end,
}