vim.filetype.add({ extension = { ["http"] = "http" } })

--A minimal 🤏 HTTP-client 🐼 interface 🖥️ for Neovim  https://github.com/mistweaverco/kulala.nvim
return {
	"mistweaverco/kulala.nvim",
	config = function()
		local kulala = require("kulala")
		kulala.setup()


		--[[
		  noremap = true: This option ensures that the keybinding is not remappable, 
	meaning it won't be overridden by other mappings.
      silent = true: This option suppresses any output or feedback that would 
			typically appear when the keybinding is used.
		--]]

		vim.keymap.set("n", "<A-k>", kulala.jump_prev, { noremap = true, silent = true })
		vim.keymap.set("n", "<A-j>", kulala.jump_next, { noremap = true, silent = true })
		vim.keymap.set("n", "<A-l>", kulala.run, { noremap = true, silent = true })
	end,
}
