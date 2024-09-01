return {
--https://wakatime.com/vim
--plugin for productivity metrics, goals, leaderboards, and automatic time tracking.
	-- { "wakatime/vim-wakatime" },
	
	--plugin for automatically highlighting other uses of the word under the cursor
	--https://github.com/RRethy/vim-illuminate
	{ "RRethy/vim-illuminate" },

--Tiny plugin to enhance Neovim's native comments https://github.com/folke/ts-comments.nvim
	{ "folke/ts-comments.nvim", opts = {}, event = "VeryLazy", enabled = true },

-- vim-be-good is a nvim plugin designed to make you better at Vim Movements. https://github.com/ThePrimeagen/vim-be-good
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },

	--Highlight colors for neovim https://github.com/brenoprata10/nvim-highlight-colors
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				virtual_symbol = "●",
				-- render = "virtual",
			})
		end,
	},
}
