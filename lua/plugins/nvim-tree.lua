-------------------------------------------------
-- name : nvim-tree
-- url  : https://github.com/nvim-tree/nvim-tree.lua
-------------------------------------------------
local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle tree" },
  },
}

function M.config()
  require("nvim-tree").setup({
    view = {
      relativenumber = true,
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * 0.5
          local window_h = screen_h * 0.8
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
          return {
            border = "rounded",
            relative = "editor",
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end,
      },
      width = function()
        return math.floor(vim.opt.columns:get() * 0.5)
      end,
    },
    renderer = {
      highlight_opened_files = "all",
      highlight_modified = "all",
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = false,
      ignore_list = {},
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    filters = {
      dotfiles = true,
    },
  })
  -- Open file when we create
  local api = require("nvim-tree.api")
  api.events.subscribe(api.events.Event.FileCreated, function(file)
    vim.cmd("edit " .. file.fname)
  end)
end

return M
