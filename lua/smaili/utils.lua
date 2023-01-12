local M = {}

-- Set keympas from a table
-- used in different files for setting keympas, to have the keympas to the plugin file
function M.set_keymappings(keymaps)

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

return M
