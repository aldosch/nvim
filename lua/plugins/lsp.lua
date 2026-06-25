return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configure LSP servers using the new vim.lsp.config API (Neovim 0.11+)
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config.ts_ls = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
      settings = {
        typescript = {
          preferences = {
            disableSuggestions = false,
          },
        },
      },
    }

    vim.lsp.config.lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
      },
    }

    vim.lsp.config.emmet_ls = {
      cmd = { "emmet-ls", "--stdio" },
      filetypes = {
        "html",
        "css",
        "scss",
        "sass",
        "less",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "astro",
        "htmldjango",
        "eruby",
        "php",
        "xml",
      },
      root_markers = { "package.json", ".git" },
      settings = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
      },
    }

    -- Enable LSP servers
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("emmet_ls")
  end,
}