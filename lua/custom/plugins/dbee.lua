return {
	{
		"kndndrj/nvim-dbee",
		dependencies = { "MunifTanjim/nui.nvim" },
		build = function()
			require("dbee").install()
		end,
		keys = { "<leader>od", "<cmd>Dbee open", desc = "Open Nvim DBEE" },
		config = function()
			local source = require("dbee.sources")
			require("dbee").setup({
				sources = {
					source.EnvSource:new("DBEE_CONNECTIONS"),
				},
			})
			vim.keymap.set("n", "<leader>od", function()
				require("dbee").open()
			end)

			---@diagnostic disable-next-line: param-type-mismatch
			local base = vim.fs.joinpath(vim.fn.stdpath("state"), "dbee", "notes")
			local pattern = string.format("%s/.*", base)
			vim.filetype.add({
				extension = {
					sql = function(path, _)
						if path:match(pattern) then
							return "sql.dbee"
						end

						return "sql"
					end,
				},

				pattern = {
					[pattern] = "sql.dbee",
				},
			})
		end,
	},
}
