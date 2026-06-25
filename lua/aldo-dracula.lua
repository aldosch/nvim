local palette = {
  bg      = "#161616",
  fg      = "#f8f8f2",
  black   = "#21222c",
  red     = "#ff5555",
  green   = "#50fa7b",
  yellow  = "#f1fa8c",
  blue    = "#bd93f9",
  magenta = "#ff79c6",
  cyan    = "#8be9fd",
  white   = "#f8f8f2",
  bright_black   = "#6272a4",
  bright_red     = "#ff6e6e",
  bright_green   = "#69ff94",
  bright_yellow  = "#ffffa5",
  bright_blue    = "#d6acff",
  bright_magenta = "#ff92df",
  bright_cyan    = "#a4ffff",
  bright_white   = "#ffffff",
  selection_bg   = "#44475a",
  selection_fg   = "#f8f8f2",
  cursor_fg      = "#f8f8f2",
  cursor_bg      = "#282a36",
}

vim.opt.termguicolors = true
vim.o.background = "dark"

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
vim.api.nvim_set_hl(0, "Todo",           { fg = palette.yellow, bg = palette.bright_black, bold = true })

-- Diagnostics and Git
vim.api.nvim_set_hl(0, "Error",          { fg = palette.red, bg = palette.bg, bold = true })
vim.api.nvim_set_hl(0, "WarningMsg",     { fg = palette.yellow, bg = palette.bg, bold = true })
vim.api.nvim_set_hl(0, "DiffAdd",        { fg = palette.green, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiffChange",     { fg = palette.yellow, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiffDelete",     { fg = palette.red, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiffText",       { fg = palette.fg, bg = palette.bright_black })

-- Cursor (GUI only)  
vim.api.nvim_set_hl(0, "Cursor",         { fg = palette.cursor_fg, bg = palette.cursor_bg })
