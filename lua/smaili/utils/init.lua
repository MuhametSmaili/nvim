smaili = {}
-- rawset(_G, "smaili", smaili)

-- Set key-map by table
-- Give a table with modes as keys for example:
-- map = {n = {[keymap]='function or what you want your keymap to execute', desc="for description"}}
function smaili.set_keymappings(keymaps)
	local default_options = {
		n = {
			noremap = true,
			silent = true,
		},
		t = {
			silent = true,
		},
	}

	-- Map through the keys
	for vimMode, keyMaps in pairs(keymaps) do
		local base_options = default_options[vimMode] or default_options["n"]

		for keyMap, commandOrTable in pairs(keyMaps) do
			local command = commandOrTable

			if type(commandOrTable) == "table" then
				command = commandOrTable[1]
				base_options = vim.tbl_extend("force", base_options, commandOrTable)
				base_options[1] = nil
			end

			vim.keymap.set(vimMode, keyMap, command, base_options)
		end
	end
end

--icons
smaili.icons = {
	lsp = {
		Array = " ",
		Boolean = " ",
		Class = " ",
		Color = " ",
		Constant = " ",
		Constructor = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = " ",
		Function = " ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Namespace = " ",
		Null = "ﳠ ",
		Number = " ", --" ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	},
	diagnostics = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	},
}
