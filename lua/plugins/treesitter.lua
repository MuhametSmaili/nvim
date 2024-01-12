return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ignore_install = { "help" },
    ensure_installed = {
      "bash",
      "html",
      "css",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "go",
      "robot",
      "vim",
      "yaml",
      "astro",
      "vimdoc",
      "dockerfile",
      "jsdoc",
      "make",
      "gitcommit",
      "git_rebase",
      "gitignore",
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
