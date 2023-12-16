return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  -- notify
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
      background_colour = "#000000",
    },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = { animation = require("mini.indentscope").gen_animation.none() },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local my_filename = require("lualine.components.filename"):extend()
      my_filename.apply_icon = require("lualine.components.filetype").apply_icon
      my_filename.colored = true

      local filename_with_path =
        { my_filename, path = 1, symbols = { modified = " ", readonly = "", unnamed = " " } }

      require("lualine").setup({
        options = {
          icons_enabled = true,
          -- globalstatus = true, -- to have just one lualine, the inactive_* won't work
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_c = { filename_with_path },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_c = { filename_with_path },
          lualine_y = {
            {
              "datetime",
              style = "default", -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
            },
          },
        },
        extensions = { "nvim-tree" },
      })
    end,
  },
}
