return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>gg",
			function()
				require("snacks").lazygit.open()
			end,
			desc = "Open LazyGit",
		},
		{
			"<leader>uc",
			function()
				require("snacks").zen()
			end,
			desc = "Toggle center mode",
		},
	},
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true, animate = { enabled = false } },
		lazygit = { enabled = true },
		statuscolumn = { enabled = true },
		zen = { enabled = true, toggles = { dim = false } },
		explorer = { enabled = true, replace_netrw = true },
		quickfile = { enabled = true },
		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignored = false,
					matcher = { sort_empty = false, fuzzy = true },
					actions = {
						search_list = function(picker)
							picker:action("focus_list")
							vim.fn.feedkeys("/", "n")
						end,
						search_list_r = function(picker)
							picker:action("focus_list")
							vim.fn.feedkeys("?", "n")
						end,
						copy_vim = function(_, item)
							Custom.explorer.make_copy_action('"')(_, item)
						end,
						copy_clip = function(_, item)
							Custom.explorer.make_copy_action('"')(_, item)
						end,
						cycle_layouts = function(picker)
							return Custom.explorer.set_next_preferred_layout(picker)
						end,
						explorer_copy_default = function(picker, item)
							Custom.explorer.explorer_copy_default(picker, item)
						end,
						jump_or_confirm = function(picker, item)
							if item.type == "file" then
								picker:action({ "pick_win", "jump" })
							else
								picker:action("confirm")
							end
						end,
						toggle_focus_with_search = function(picker)
							-- Get the current filter text
							local filter_text = picker.input.filter.pattern

							-- Set the search register if there's text in the filter
							if filter_text and filter_text ~= "" then
								-- Escape special characters for search
								local search_text = filter_text:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "\\%1")
								vim.fn.setreg("/", search_text)
							end

							-- Toggle focus
							if vim.api.nvim_get_current_win() == picker.input.win.win then
								picker:focus("list", { show = true })
							else
								picker:focus("input", { show = true })
							end
						end,
					},
					win = {
						list = {
							wo = {
								relativenumber = true,
							},
							keys = {
								["/"] = { "search_list", mode = { "n" }, desc = "Search list" },
								["?"] = { "search_list_r", mode = { "n" }, desc = "Search list reverse" },
								["g?"] = { "toggle_help_list" },
								["F"] = { "toggle_focus", desc = "Filter tree" },
								["y"] = { "copy_vim", desc = "Yank to vim" },
								["Y"] = { "copy_clip", desc = "Yank to clipboard" },
								["<cr>"] = { "jump_or_confirm", mode = { "n", "i" }, desc = "Pick window" },
								["<c-w>c"] = { "cycle_layouts", mode = { "i", "n" } }, -- overids the input focus
								["c"] = "explorer_copy_default",
							},
						},
						input = {
							keys = {
								["<CR>"] = { "toggle_focus_with_search", mode = "i" },
							},
						},
					},
					auto_close = true,
					layout = {
						preset = function()
							return Custom.explorer.preferred_layout()
						end,
						auto_hide = { "input" },
						cycle = true,
					},
				},
			},
		},

		dashboard = { enabled = false },
		scroll = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		words = { enabled = false },
	},
}
