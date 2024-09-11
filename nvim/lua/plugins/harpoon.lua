return {
	-- Other plugins
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				-- You can configure Harpoon here if needed
				-- Example:
				-- menu = {
				--   width = vim.api.nvim_win_get_width(0) - 4,
				-- }
			})
		end,
	},
	-- Add other plugins or configurations here
}
