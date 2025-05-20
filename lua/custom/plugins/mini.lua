return {
	{
		"echasnovski/mini.ai",
		dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
				search_method = "cover_or_next",
				-- search_method = "cover_or_nearest",
			}
		end,
		event = { "BufReadPost" },
	},
	{
		"echasnovski/mini.bracketed",
		version = "*",
		opts = {},
		keys = { { "[" }, { "]" } },
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPost",
		opts = function()
			local highlighters = {}
			for _, word in ipairs({ "todo", "note", "hack", "pref", "fix" }) do
				highlighters[word] = {
					pattern = string.format("%%f[%%w]()%s()%%f[%%W]", word:upper()),
					group = string.format("MiniHipatterns%s", word:sub(1, 1):upper() .. word:sub(2)),
				}
			end

			return { highlighters = highlighters }
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		opts = { search_method = "cover_or_next" },
		keys = { { "s", mode = { "n", "v", "x" } } },
	},
	{
		"echasnovski/mini.splitjoin",
		version = "*",
		opts = {},
		keys = { { "gS" } },
	},
	{
		"echasnovski/mini.icons",
		opts = {
			file = {
				[".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				[".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
				-- [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
				[".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
				["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
				["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
				[".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
				gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
			},
			filetype = {
				gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
			},
		},
		lazy = false,
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
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
	{ "echasnovski/mini.pairs", opts = {}, event = { "InsertEnter" } },
}
