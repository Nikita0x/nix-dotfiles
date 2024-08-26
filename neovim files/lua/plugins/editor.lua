return {
	--[[
	--Highly experimental plugin that completely replaces the UI 
	--for messages, cmdline and the popupmenu.
	--https://github.com/folke/noice.nvim
	--]]
	{
		"folke/noice.nvim",
		-- TODO: redraw issue, folke on vacation till the end of August
		tag = "v4.4.7",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					signature = { opts = { size = { width = 80, height = 10 } } },
				},
				presets = { command_palette = true, lsp_doc_border = false },
			})
		end,
	},
	-- Find and replace plugin - https://github.com/MagicDuck/grug-far.nvim
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			local grug_far = require("grug-far")
			grug_far.setup()

			vim.keymap.set("n", "<leader>g;", grug_far.grug_far, { desc = "Global find and replace" })
		end,
	},
	-- Bufferline (Tabs line) https://github.com/akinsho/bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					show_close_icon = false,
					show_buffer_close_icons = false,
					indicator = { style = "none" },
					separator_style = { "", "" },
					offsets = {
						{
							filetype = "neo-tree",
							text = "I use neovim btw ;)",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>q", require("bufferline").close_others)
			-- stylua: ignore
			vim.keymap.set("n", "L", function() require("bufferline").cycle(1) end)
			-- stylua: ignore
			vim.keymap.set("n", "H", function() require("bufferline").cycle(-1) end)
		end,
	},
	-- Statusline - https://github.com/nvim-lualine/lualine.nvim 
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({ options = { globalstatus = true } })
		end,
	},
	-- Scrollbar - https://github.com/petertriho/nvim-scrollbar
	{
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		config = function()
			require("scrollbar").setup({
				handlers = { cursor = false },
				excluded_filetypes = { "neo-tree" },
			})
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},
}
