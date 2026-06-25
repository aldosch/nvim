local palette = {
  bg      = "#ffffff",
  fg      = "#282a36",
  black   = "#e4e4ef",
  red     = "#c0392b",
  green   = "#2d9648",
  yellow  = "#b8860b",
  blue    = "#6b21c2",
  magenta = "#b5179e",
  cyan    = "#0085a1",
  white   = "#282a36",
  bright_black   = "#6272a4",
  bright_red     = "#e05252",
  bright_green   = "#3aad5a",
  bright_yellow  = "#d4a017",
  bright_blue    = "#8b35d6",
  bright_magenta = "#cc2eb5",
  bright_cyan    = "#00a0c0",
  bright_white   = "#44475a",
  selection_bg   = "#d0d0e8",
  selection_fg   = "#282a36",
  cursor_fg      = "#ffffff",
  cursor_bg      = "#282a36",
  panel_bg       = "#f0f0f5",
}

vim.opt.termguicolors = true
vim.o.background = "light"

-- Normal text and UI
vim.api.nvim_set_hl(0, "Normal",         { fg = palette.fg, bg = palette.bg })
vim.api.nvim_set_hl(0, "CursorLine",     { bg = palette.black })
vim.api.nvim_set_hl(0, "Visual",         { fg = palette.selection_fg, bg = palette.selection_bg })
vim.api.nvim_set_hl(0, "LineNr",         { fg = palette.bright_black, bg = palette.bg })
vim.api.nvim_set_hl(0, "CursorLineNr",   { fg = palette.yellow, bg = palette.black, bold = true })
vim.api.nvim_set_hl(0, "VertSplit",      { fg = palette.black })
vim.api.nvim_set_hl(0, "StatusLine",     { fg = palette.fg, bg = palette.black })
vim.api.nvim_set_hl(0, "Pmenu",          { fg = palette.fg, bg = palette.selection_bg })
vim.api.nvim_set_hl(0, "PmenuSel",       { fg = palette.bg, bg = palette.blue, bold = true })

-- Syntax highlighting
vim.api.nvim_set_hl(0, "Comment",        { fg = palette.bright_black, italic = true })
vim.api.nvim_set_hl(0, "Constant",       { fg = palette.cyan })
vim.api.nvim_set_hl(0, "String",         { fg = palette.green })
vim.api.nvim_set_hl(0, "Character",      { fg = palette.yellow })
vim.api.nvim_set_hl(0, "Number",         { fg = palette.magenta })
vim.api.nvim_set_hl(0, "Boolean",        { fg = palette.bright_red })
vim.api.nvim_set_hl(0, "Identifier",     { fg = palette.fg })
vim.api.nvim_set_hl(0, "Function",       { fg = palette.blue })
vim.api.nvim_set_hl(0, "Statement",      { fg = palette.magenta, bold = true })
vim.api.nvim_set_hl(0, "Operator",       { fg = palette.magenta })
vim.api.nvim_set_hl(0, "Keyword",        { fg = palette.magenta })
vim.api.nvim_set_hl(0, "Type",           { fg = palette.yellow })
vim.api.nvim_set_hl(0, "Special",        { fg = palette.cyan })
vim.api.nvim_set_hl(0, "Todo",           { fg = palette.yellow, bg = palette.black, bold = true })

-- Diagnostics and Git
vim.api.nvim_set_hl(0, "Error",          { fg = palette.red, bg = palette.bg, bold = true })
vim.api.nvim_set_hl(0, "WarningMsg",     { fg = palette.yellow, bg = palette.bg, bold = true })
vim.api.nvim_set_hl(0, "DiffAdd",        { fg = palette.green, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiffChange",     { fg = palette.yellow, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiffDelete",     { fg = palette.red, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiffText",       { fg = palette.fg, bg = palette.black })

-- Cursor (GUI only)
vim.api.nvim_set_hl(0, "Cursor",         { fg = palette.cursor_fg, bg = palette.cursor_bg })
