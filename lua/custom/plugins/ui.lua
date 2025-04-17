return {
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		cmd = { "NoNeckPain" },
		keys = {
			{ "<leader>uc", "<cmd>NoNeckPain<cr>", desc = "Toggle center-screen" },
			{ "<leader>uz", "<cmd>NoNeckPain<cr>", desc = "Toggle center-screen" },
			{
				"<leader>uZ",
				function()
					local nnp = require("no-neck-pain")
					local ok = pcall(nnp.toggleScratchPad)
					if not ok then
						nnp.toggle()
						vim.defer_fn(function() -- Introduce a 100ms delay before running the second command
							nnp.toggleScratchPad()
						end, 100)
					end
				end,
				desc = "Toggle notes for center screen (Toggles center if not enabled)",
			},
		},
		opts = {
			width = 120,
			buffers = {
				scratchPad = {
					enabled = false,
					fileName = "notes",
					location = "~/",
				},
				bo = {
					filetype = "md",
				},
			},
		},
	},
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>bd",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bD",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},
}
