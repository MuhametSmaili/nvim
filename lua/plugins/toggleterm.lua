-------------------------------------------------
-- name : toggleterm-nvim
-- url  : https://github.com/akinsho/toggleterm.nvim
-------------------------------------------------

return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "Toggle terminal float" },
    { "<C-`>", ":ToggleTerm<CR>", desc = "Toggle terminal float" },
    { "<leader>gl", desc = "Toggle lazygit" },
  },
  opts = {
    open_mapping = [[<c-`>]],
    direction = "float",
    start_in_insert = true,
  },
  config = function(plugin, opts)
    require("toggleterm").setup(opts)

    --------------------------
    -- Lazygit
    --------------------------
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      count = 5,
    })

    vim.keymap.set("n", "<leader>gl", function()
      lazygit:toggle()
    end, { noremap = true, silent = true, desc = "Toggle lazygit" })
  end,
}
