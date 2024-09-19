-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp-signature-help",
--     },
--     opts = function(_, opts)
--       local cmp = require("cmp")
--       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
--         { name = "nvim_lsp_signature_help" },
--       }))
--     end,
--   },
-- }
--

-- return {
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		dependencies = {
-- 			"hrsh7th/cmp-nvim-lsp-signature-help",
-- 		},
-- 		opts = function(_, opts)
-- 			local cmp = require("cmp")
--
-- 			-- Helper function to check if there are words before the cursor
-- 			local has_words_before = function()
-- 				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 				return col ~= 0
-- 					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- 			end
--
-- 			opts.mapping = {
-- 				-- Tab: If completion menu is visible, select next item; otherwise fallback to default
-- 				["<Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_next_item()
-- 					elseif has_words_before() then
-- 						cmp.complete()
-- 					else
-- 						fallback() -- Default behavior
-- 					end
-- 				end, { "i", "s" }), -- Applies to insert and select modes
--
-- 				-- Shift+Tab: If completion menu is visible, select previous item; otherwise fallback to default
-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_prev_item()
-- 					else
-- 						fallback() -- Default behavior
-- 					end
-- 				end, { "i", "s" }),
--
-- 				-- Enter to confirm selection
-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 			}
--
-- 			-- Add your signature help source
-- 			opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
-- 				{ name = "nvim_lsp_signature_help" },
-- 			}))
-- 		end,
-- 	},
-- }
--
--

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		opts = function(_, opts)
			local cmp = require("cmp")

			-- Helper function to check if there are words before the cursor
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			opts.mapping = {
				-- Tab: If completion menu is visible, select next item; otherwise fallback to default
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback() -- Default behavior
					end
				end, { "i", "s" }), -- Applies to insert and select modes

				-- Shift+Tab: If completion menu is visible, select previous item; otherwise fallback to default
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback() -- Default behavior
					end
				end, { "i", "s" }),

				-- Enter to confirm selection
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}

			-- Add your signature help and other sources
			opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_px_to_rem" }, -- Adding the px to rem source
			}))
		end,
	},
}
