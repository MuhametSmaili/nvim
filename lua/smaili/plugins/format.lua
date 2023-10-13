return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ lsp_fallback = true, async = true, timeout_ms = 500 })
			end,
			desc = "Format document",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			-- typescriptreact = { "prettierd", "eslint_d" },
			typescriptreact = { "prettierd", "eslint_d" },
			astro = { { "prettierd", "prettier" } },
			css = { { "prettierd", "prettier" } },
			html = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			yaml = { { "prettierd", "prettier" } },
			markdown = { { "prettierd", "prettier" } },
			graphql = { { "prettierd", "prettier" } },
		},
		format_on_save = {
			async = true,
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	config = function(_, opts)
		local util = require("conform.util")
		-- running eslint fix
		util.add_formatter_args(require("conform.formatters.eslint_d"), { "--fix" })
		require("conform").setup(opts)
	end,
}
