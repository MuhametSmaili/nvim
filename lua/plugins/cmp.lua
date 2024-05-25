return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })

      -- opts.mapping = vim.tbl_extend("force", opts.mapping, {
      --
      -- })

      -- CMP follow follow_cursor
      -- opts.view.entries.follow_cursor = true

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
      opts.experimental.ghost_text = nil
      opts.sources =
        cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" }, { name = "nvim_lsp_signature_help" } }))
    end,
  },
}
