-- Theme switcher: detects macOS appearance and loads the right palette.
-- Called at startup (init.lua) and by auto-dark-mode.nvim callbacks.

local M = {}

local function is_dark()
  local result = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
  return vim.trim(result) == "Dark"
end

function M.apply_dark()
  package.loaded["aldo-dracula"] = nil
  require("aldo-dracula")
end

function M.apply_light()
  package.loaded["aldo-dracula-light"] = nil
  require("aldo-dracula-light")
end

function M.apply()
  if is_dark() then
    M.apply_dark()
  else
    M.apply_light()
  end
end

return M
