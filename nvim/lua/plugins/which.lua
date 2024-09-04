return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  -- keys = {
  --   {
  --     "<leader>?",
  --     function()
  --       require("which-key").show({ global = false })
  --     end,
  --     desc = "Buffer Local Keymaps (which-key)",
  --   },
  -- },
	--TEST below
	config = function()
    local wk = require("which-key")

    -- Register key mappings and their descriptions
    wk.register({
      ["<leader>"] = {
        d = { vim.diagnostic.open_float, "Show Diagnostics" },
        f = { vim.diagnostic.open_float, "Telescope" },
        r = { vim.diagnostic.open_float, "Restart LSP" },
        -- Add more mappings here as needed
      },
			["<F2>"] = {
				r = {"Show References"},
				d = {"Show Definitions"},

			},
		})
  end,
}
