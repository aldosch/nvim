-- Minimal mode for focused writing without distractions
local M = {}

-- Track state
M.is_minimal = false

function M.toggle()
  M.is_minimal = not M.is_minimal
  
  if M.is_minimal then
    -- Enable minimal mode
    vim.notify("🌱", vim.log.levels.INFO, { timeout = 500 })
    
    -- Disable Copilot
    local ok_cp, copilot = pcall(require, "copilot.command")
    if ok_cp then copilot.disable() else vim.cmd("Copilot disable") end
    
    -- Disable nvim-cmp
    local ok, cmp = pcall(require, "cmp")
    if ok then
      cmp.setup.buffer({ enabled = false })
    end
  else
    -- Disable minimal mode
    vim.notify("🦾", vim.log.levels.INFO, { timeout = 500 })
    
    -- Enable Copilot
    local ok_cp, copilot = pcall(require, "copilot.command")
    if ok_cp then copilot.enable() else vim.cmd("Copilot enable") end
    
    -- Enable nvim-cmp
    local ok, cmp = pcall(require, "cmp")
    if ok then
      cmp.setup.buffer({ enabled = true })
    end
  end
end

return M
