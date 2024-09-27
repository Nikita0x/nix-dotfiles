return {
	"Wansmer/langmapper.nvim",
	lazy = false,
	priority = 1,
	config = function()
		-- Set up the langmapper plugin
		local langmapper = require("langmapper")

		langmapper.setup({
			-- You can add plugin-specific settings here, if needed
		})

		-- Add the keybindings for both English and Cyrillic layouts
		langmapper.map("v", "V", "j", { noremap = true, silent = true })
	end,
}
