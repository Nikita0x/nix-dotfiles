
return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.1",  -- You can specify the version or remove this line to use the latest version
  event = "VeryLazy",  -- Load plugin lazily
  dependencies = { { "nvim-lua/plenary.nvim" } },  -- Required dependency for telescope

  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default + actions.center,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",  -- Use a dropdown theme for find_files
        },
        live_grep = {
          theme = "ivy",  -- Use an ivy theme for live_grep
        },
      },
      extensions = {
        -- Example for the fzf-native extension
        fzf = {
          fuzzy = true,  -- Enable fuzzy search
          override_generic_sorter = true,  -- Override the generic sorter
          override_file_sorter = true,  -- Override the file sorter
          case_mode = "smart_case",  -- Use smart case mode
        },
      },
    }
  end,

  -- Key mappings for various Telescope commands
  keys = {
    -- { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help Tags" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
    { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
		--below is not working!
	-- { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find Symbols in File" },
  },
}
