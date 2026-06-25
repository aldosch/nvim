# ▋ nvim

aldo's neovim config for macos. treesitter-aware navigation, copilot completions, and keybindings that match the rest of macos (cmd to jump around lines, opt to move by word, and so on).

**needs**: neovim >= 0.11, git, a nerd font

---

## first run

1. launch `nvim` — lazy.nvim bootstraps itself and installs the plugins
2. `:Copilot auth` and follow the browser prompt (needed for completions)
3. sanity check: `:Lazy`, `:Copilot status`, `:LspInfo`, `:checkhealth`
4. optional: grab extra lsp servers and formatters with `:Mason`

---

## keybindings

leader is `<Space>`. notation: `<D-x>` = cmd+x, `<M-x>` = opt+x, `<C-x>` = ctrl+x.

### files & search

| key | action |
|-----|--------|
| `<D-p>` | find files |
| `<D-P>` | command palette |
| `<D-g>` | live grep |
| `<D-B>` | switch buffers |
| `<D-b>` / `<leader>b` | file browser (oil) |
| `<leader>ff` | find files |
| `<leader>fb` | find buffers |
| `<leader>fr` | recent files |
| `<leader>gg` | live grep |
| `<leader>fh` | help tags |
| `<leader>yy` | yank history (neoclip) |
| `<leader>p` / `<leader>pp` | copy relative path / filename |

### navigation

| key | action |
|-----|--------|
| `<D-C-M-S-e>` | expand selection (treesitter-aware) |
| `<D-C-M-S-r>` | reduce selection |
| `<M-Up>` / `<M-Down>` | jump to scope start / end |
| `<M-Left>` / `<M-Right>` | previous / next sibling node |
| `s` | flash jump |
| `S` | flash treesitter nodes |
| `]t` / `[t` | next / prev todo |

### line & word movement

| key | action |
|-----|--------|
| `<D-Left>` / `<D-Right>` | line start / end |
| `<D-S-Left>` / `<D-S-Right>` | select to line start / end |
| `<C-a>` / `<C-e>` | first non-blank / line end |
| `<M-S-Left>` / `<M-S-Right>` | select word |

### code & lsp

| key | action |
|-----|--------|
| `<leader>lf` | format (document or selection) |
| `<D-/>` | toggle comment |
| `gc` / `gcc` | comment motion / line |
| `gd` | go to definition |
| `gr` | references |
| `K` | hover docs |
| `<leader>cp` | copilot panel |

### git

| key | action |
|-----|--------|
| `<leader>gp` | preview hunk |
| `<leader>gb` | toggle line blame |
| `<leader>gd` | diff |
| `]c` / `[c` | next / prev hunk |

### folding (ufo)

| key | action |
|-----|--------|
| `zR` / `zM` | open / close all folds |
| `zr` / `zm` | fold less / more |
| `za` | toggle fold |
| `zK` | peek fold |

### windows & buffers

| key | action |
|-----|--------|
| `<leader>sv` / `<leader>sh` | split vertical / horizontal |
| `<leader>sc` | close split |
| `<leader>bn` / `<leader>bp` | next / prev buffer |
| `<leader>bd` | delete buffer |

### editing

| key | action |
|-----|--------|
| `<leader>nh` | clear search highlights |
| `<` / `>` (visual) | indent, keep selection |
| `J` / `K` (visual) | move lines down / up |
| `daw` / `diw` | delete word without touching the clipboard |
| `<leader>ln` | toggle line numbers, padding and git signs |
| `<leader>mm` | minimal mode — turn off copilot and completions for focused writing |

---

## commands

| command | purpose |
|---------|---------|
| `:Lazy` | plugin manager |
| `:Mason` | lsp / formatter installer |
| `:LspInfo` | active lsp servers |
| `:ConformInfo` | formatter status |
| `:Copilot auth` / `status` / `panel` | copilot |
| `:TSUpdate` | update treesitter parsers |
| `:checkhealth` | diagnose problems |

---

## what's set up

- **lsp**: typescript, lua, emmet (mason + nvim-lspconfig)
- **completions**: nvim-cmp + luasnip + copilot
- **formatting**: conform, format-on-save (prettier, stylua)
- **finding**: telescope (files, buffers, grep, todos), neoclip for yank history
- **files**: oil.nvim (edit the filesystem like a buffer)
- **git**: gitsigns
- **moving around**: flash, treesitter smart selection and scope navigation
- **folding**: ufo, lsp-powered
- **theme**: custom dracula that follows the macos dark/light setting (auto-dark-mode)
- **extras**: comment.nvim, autopairs, autotags, todo-comments, neoscroll, smear cursor, undo glow, treesitter context, which-key, minimal mode

---

## structure

```
~/.config/nvim/
├── init.lua                    # entry point, bootstraps lazy
├── lua/
│   ├── theme.lua               # dark/light switcher
│   ├── aldo-dracula.lua        # dark palette
│   ├── aldo-dracula-light.lua  # light palette
│   ├── config/
│   │   ├── settings.lua        # options
│   │   ├── keymaps.lua         # keybindings
│   │   ├── autocmds.lua        # autocommands
│   │   └── minimal_mode.lua    # focused-writing toggle
│   ├── plugins/                # one file per plugin, init.lua aggregates
│   └── utils/
│       ├── smart_selection.lua # vscode-style expand/reduce
│       └── scope_navigation.lua# treesitter scope/sibling jumps
└── backup/, swap/              # created on demand
```

---

## tweaking it

**add an lsp server**: `:Mason` to install, then add it in `lua/plugins/lsp.lua` with `vim.lsp.config` + `vim.lsp.enable`.

**add a formatter**: `:Mason` to install, then add it to `formatters_by_ft` in `lua/plugins/conform.lua`.

**add a plugin**: drop a `lua/plugins/<name>.lua` returning a lazy spec, then `require` it from `lua/plugins/init.lua`.

---

## settings worth knowing

- 2-space tabs
- system clipboard (`unnamedplus`)
- smart-case search (case-insensitive until you type a capital)
- backups in `~/.config/nvim/backup/`, swap in `~/.config/nvim/swap/`
- no status line — it stays out of the way

---

## when something breaks

- **lsp quiet**: `:LspInfo` to see what's attached, `:Mason` to install what's missing
- **formatter not running**: `:ConformInfo`, bump the timeout in `conform.lua` if needed
- **copilot not suggesting**: `:Copilot status`, then `:Copilot auth`
- **treesitter errors**: `:TSUpdate`, then `:checkhealth nvim-treesitter`
</content>
