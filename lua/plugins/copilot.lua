return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  -- Never load in headless mode (no UIs attached). Guards against the Copilot
  -- LSP node process being spawned during `nvim --headless +Lazy! sync`, which
  -- fails to shut down cleanly on nvim 0.12 and hangs the quit indefinitely.
  cond = function()
    return #vim.api.nvim_list_uis() > 0
  end,
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom",
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = false,
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = vim.fn.expand("~/.local/share/fnm/node-versions/v24.7.0/installation/bin/node"),
      server_opts_overrides = {},
    })
  end,
}
