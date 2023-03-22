-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    -- MY CONFIG
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    -- MY CONFIG
    autoindent = true,
    smarttab = true,
    copyindent = true,
    preserveindent = true,
    -- MY CONFIG
    colorcolumn = "80",
    --foldmethod = "indent",
    --foldlevel = 0,
    --foldclose = "all",
    -- MY CONFIG
    list = true,
    listchars = {
      -- eol = "↓",
      eol = "$",
      tab = "> ",
      trail = "-",
      nbsp = "-",
      extends = ">",
      precedes = "<",
      space = "·",
    },
    -- :set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
    -- MY CONFIG (gruvbox)
    background = "dark",
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    -- gruvbox
    --gruvbox_material_background = 'hard',
    --sonokai_style = 'andromeda',
    sonokai_style = 'shusia',
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
