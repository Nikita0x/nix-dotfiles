return {
  -- A plugin for managing terminal windows in Neovim.
  -- https://github.com/akinsho/toggleterm.nvim
  "akinsho/toggleterm.nvim",
  opts = {
    -- You can customize the options here.
    -- For example, setting the size of the terminal window:
    size = 15,  -- or a function like function(term) return math.floor(vim.o.lines * 0.3) end
    direction = 'horizontal',  -- Terminal direction ('vertical', 'horizontal', 'tab', or 'float')
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1', -- The degree of shading (0-100)
    start_in_insert = true, -- Start in insert mode when opening terminal
    persist_mode = true, -- Keep the terminal open after switching buffers
    highlights = {
      -- This highlights the terminal window
      Normal = { guifg = "#ffffff", guibg = "#000000" },
      NormalFloat = { guifg = "#ffffff", guibg = "#000000" },
    },
  },
  keys = {
    {"<S-Tab>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    -- { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
    -- { "<S-Tab>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
    -- { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
    -- { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
  },
}



