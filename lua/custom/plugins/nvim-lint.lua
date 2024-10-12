return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local eslint_filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "astro" }
		for _, ft in ipairs(eslint_filetypes) do
			lint.linters_by_ft[ft] = { "eslint_d" }
		end

		lint.linters_by_ft = vim.tbl_extend("force", lint.linters_by_ft, {
			go = { "golangci-lint" },
			yaml = { "yamllint" },
			["*"] = { "write-good" },
		})

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		require("lint").linters.eslint_d = {
			cmd = "eslint_d",
			args = {
				"--stdin",
				"--stdin-filename",
				"%filepath",
				"--cache",
				"--cache-location",
				"node_modules/.cache/eslint",
				"--ext",
				".js,.jsx,.ts,.tsx",
				-- "--fix",
				-- "--max-warnings",
				-- "0",
			},
			stream = "both",
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "eslint_d",
				severity = vim.lsp.protocol.DiagnosticSeverity.Warning,
			}),
		}

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
