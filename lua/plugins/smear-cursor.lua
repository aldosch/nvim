return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Smear cursor color
    cursor_color = "#d3c6aa",
    -- Smear cursor when switching buffers or windows
    smear_between_buffers = true,
    -- Smear cursor when moving in insert mode
    smear_between_neighbor_lines = true,
    -- Use floating windows to display the smeared cursor
    use_floating_windows = true,
    -- Set to `true` if your font supports legacy computing symbols
    legacy_computing_symbols_support = false,
  },
}