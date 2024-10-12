return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ lsp_fallback = true, async = true, timeout_ms = 500 })
			end,
			desc = "Format document",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "eslint_d" },
			javascriptreact = { "prettierd", "eslint_d" },
			typescriptreact = { "prettierd", "eslint_d" },
			astro = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			json = { "prettierd" },
			yaml = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			graphql = { "prettierd", "prettier" },
			["_"] = { "trim_whitespace" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_after_save = {
			async = true,
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},
	config = function(_, opts)
		local util = require("conform.util")
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		-- running eslint fix
		util.add_formatter_args(require("conform.formatters.eslint_d"), { "--fix" })
		require("conform").setup(opts)
	end,
}
