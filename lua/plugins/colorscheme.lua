return {
  { "sainnhe/everforest", lazy = true },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd("let g:gruvbox_material_background = 'hard'")
    end,
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      highlight_overrides = {
        all = function(_)
          return {
            LineNr = { fg = "#4b5481" },
          }
        end,
      },
      integrations = {
        harpoon = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
