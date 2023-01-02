-------------------------------------------------
-- name : nvim-lualine
-- url  : https://github.com/nvim-lualine/lualine.nvim
-------------------------------------------------
local M = {
	"nvim-lualine/lualine.nvim",
  event = "VeryLazy"
}

function M.config ()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        -- theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    }
end

return M;
