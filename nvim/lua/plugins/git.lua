-- vim.keymap.set("n", "<leader>g", "<cmd>Neogit<CR>", { desc = "Open Git" })

-- return {
-- 	-- An interactive and powerful Git interface for Neovim, inspired by Magit https://github.com/NeogitOrg/neogit
-- 	{
-- 		"NeogitOrg/neogit",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"sindrets/diffview.nvim",
-- 			"ibhagwan/fzf-lua",
-- 		},
-- 		config = function()
-- 			local diffview = require("diffview")
-- 			diffview.setup()
--
-- 			require("neogit").setup({ integrations = { diffview = true, fzf_lua = true } })
--
-- 			vim.keymap.set("n", "gvo", diffview.open)
-- 			vim.keymap.set("n", "gvc", diffview.close)
-- 		end,
-- 	},
-- 	-- Git integration for buffers https://github.com/lewis6991/gitsigns.nvim
-- }
-- return {
--   "kdheepak/lazygit.nvim",
--   cmd = {
--     "LazyGit",
--     "LazyGitConfig",
--     "LazyGitCurrentFile",
--     "LazyGitFilter",
--     "LazyGitFilterCurrentFile",
--   },
--   -- optional for floating window border decoration
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--   },
--   -- setting the keybinding for LazyGit with 'keys' is recommended in
--   -- order to load the plugin when the command is run for the first time
--   keys = {
--     { "<leader>g", "<cmd>LazyGit<cr>", desc = "Open Git" }
--   },
-- {
-- 	"lewis6991/gitsigns.nvim",
-- 	config = function()
-- 		require("gitsigns").setup({
-- 			numhl = true,
-- 			signs = {
-- 				add = { text = "+" },            -- Added lines
-- 				change = { text = "~" },         -- Modified lines
-- 				delete = { text = "-" },         -- Deleted lines
-- 				topdelete = { text = "-" },      -- Top of the deleted lines
-- 				changedelete = { text = "~" },   -- Changed lines that were deleted
-- 				untracked = { text = "?" },      -- Untracked lines (optional sign)
-- 			},
-- 			signs_staged = {
-- 				add = { text = "+" },
-- 				change = { text = "~" },
-- 				delete = { text = "-" },
-- 				topdelete = { text = "-" },
-- 				changedelete = { text = "~" },
-- 			},
-- 			on_attach = function(buffer)
-- 				local function keymap(mode, l, r)
-- 					vim.keymap.set(mode, l, r, { buffer = buffer })
-- 				end
--
-- 				local gitsigns = require("gitsigns")
-- 				local fzf = require("fzf-lua")
--
-- 				-- Customize key mappings if needed
-- 				-- keymap("n", "gh", gitsigns.preview_hunk)
-- 				-- keymap("n", "ghs", gitsigns.stage_hunk)
-- 				-- keymap("n", "ghu", gitsigns.undo_stage_hunk)
-- 				-- keymap("n", "ghx", gitsigns.reset_hunk)
--
-- 				keymap("n", "ghh", fzf.git_bcommits)
-- 			end,
-- 		})
-- 	end,
-- },
--
-- }

return {
	-- LazyGit configuration
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- Optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- Setting the keybinding for LazyGit
		keys = {
			{ "<leader>g", "<cmd>LazyGit<cr>", desc = "Open Git" },
		},
	},

	-- gitsigns.nvim configuration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				numhl = true,
				signs = {
					add = { text = "+" }, -- Added lines
					change = { text = "~" }, -- Modified lines
					delete = { text = "-" }, -- Deleted lines
					topdelete = { text = "-" }, -- Top of the deleted lines
					changedelete = { text = "~" }, -- Changed lines that were deleted
					untracked = { text = "?" }, -- Untracked lines (optional sign)
				},
				signs_staged = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "-" },
					topdelete = { text = "-" },
					changedelete = { text = "~" },
				},
				on_attach = function(buffer)
					local function keymap(mode, l, r)
						vim.keymap.set(mode, l, r, { buffer = buffer })
					end

					local gitsigns = require("gitsigns")
					local fzf = require("fzf-lua")

					-- Customize key mappings if needed
					-- keymap("n", "gh", gitsigns.preview_hunk)
					-- keymap("n", "ghs", gitsigns.stage_hunk)
					-- keymap("n", "ghu", gitsigns.undo_stage_hunk)
					-- keymap("n", "ghx", gitsigns.reset_hunk)

					-- keymap("n", "ghh", fzf.git_bcommits)
				end,
			})
		end,
	},
}
