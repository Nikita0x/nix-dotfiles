-- return {
-- 	--Nvim Treesitter configurations and abstraction layer https://github.com/nvim-treesitter/nvim-treesitter
-- 	"nvim-treesitter/nvim-treesitter",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	build = ":TSUpdate",
-- 	dependencies = {
-- 		"nvim-treesitter/nvim-treesitter-context",
-- 		"windwp/nvim-ts-autotag",
-- 	},
-- 	config = function()
-- 		local treesitter = require("nvim-treesitter.configs")
--
-- 		---@diagnostic disable-next-line: missing-fields
-- 		treesitter.setup({
--       ensure_installed = { "vue", "javascript", "typescript", "lua", "html", "css" }, -- Specify the parsers you want installed
-- 			sync_install = false,
-- 			auto_install = true,
-- 			indent = { enable = true },
-- 			highlight = {
-- 				enable = true,
-- 				additional_vim_regex_highlighting = false,
-- 			},
-- 		})
--
-- 		require("nvim-ts-autotag").setup({
-- 			opts = {
-- 				enable_close = true,
-- 				enable_rename = true,
-- 				enable_close_on_slash = false,
-- 			},
-- 		})
--
-- 		require("treesitter-context").setup({
-- 			enable = true,
-- 			max_lines = 1,
-- 		})
-- 	end,
-- }
--
return {
	-- Nvim Treesitter configurations and abstraction layer https://github.com/nvim-treesitter/nvim-treesitter
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line: missing-fields
		treesitter.setup({
			ensure_installed = { "vue", "javascript", "typescript", "lua", "html", "css" }, -- Specify the parsers you want installed
			sync_install = false,
			auto_install = true,
			indent = { enable = true },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- Incremental selection setup
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>", -- Start selection with Enter
					node_incremental = "<CR>", -- Increment selection with Enter
					node_decremental = "<BS>", -- Decrement selection with Backspace
				},
			},
		})

		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})

		require("treesitter-context").setup({
			enable = true,
			max_lines = 1,
		})
	end,
}
