
return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Ensure plenary is installed as a dependency
  keys = {
    {
      "<leader>S",
      function()
        require("spectre").open()
      end,
      desc = "Open Spectre",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Search Current Word",
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Search in Current File",
    },
  },
  config = function()
    require("spectre").setup()
  end,
}
