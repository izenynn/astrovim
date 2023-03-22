return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --{
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        bold = true,
        palette_overrides = {
        transparent_mode = true,
      },
     })
   end,
  },
  {
    "sainnhe/gruvbox-material",
  },
  {
    "sainnhe/sonokai",
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        mirage = false,
     })
   end,

  },
}
