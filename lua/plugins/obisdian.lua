return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "preservim/vim-markdown",
  },
  keys = {
    { "<leader>on", ":ObsidianNew<cr>", desc = "Create a new note" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
    preferred_link_style = "markdown",
    notes_subdir = "_in",
    new_notes_location = "notes_subdir",
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    disable_frontmatter = true,
    picker = {
      name = "fzf-lua",
    },
    note_id_func = function(title)
      local suffix = ""
      -- get current ISO datetime with -1 hour offset from UTC for EST
      local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 1 * 3600)
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return current_datetime .. "_" .. suffix
    end,

    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    completion = {
      nvim_cmp = true,
    },
  },
}
