local function snacks_status()
	local Snacks = require("snacks")

	local filetype = vim.bo.filetype
	local left_side = filetype
	local right_side = ""

	if filetype == "snacks_terminal" then
		left_side = " Terminal"
		right_side = vim.fn.expand("%:t"):match(".*:(%S+)$") or vim.fn.expand("%:t")
	elseif filetype == "snacks_picker_list" then
		left_side = "  Explorer"
		local picker = Snacks.picker.get()[1]
		if picker then
			right_side = vim.fn.fnamemodify(picker:dir(), ":~")
		else
			right_side = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
		end
	elseif filetype == "snacks_picker_input" then
		left_side = "Picker"
		local picker = Snacks.picker.get()[1]
		if picker then
			local input = picker.input and picker.input:get() or ""
			local count = #picker:items()
			right_side = input ~= "" and (" " .. input .. ": " .. count .. " results") or (count .. " results")
		else
			right_side = ""
		end
	end

	return left_side, right_side
end

local function left_side()
	local title, _ = snacks_status()
	return title
end

local function right_side()
	local _, status = snacks_status()
	return status
end

return {
	sections = {
		lualine_a = { left_side },
		lualine_z = { right_side },
	},
	filetypes = {
		"snacks_terminal",
		"snacks_picker_list",
		"snacks_picker_input",
	},
}
