return {
  {
    "LhKipp/nvim-nu",
    version = "*", -- Pin to GitHub releases
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    build = function()
      vim.api.nvim_command("TSInstall nu")
    end,
  },
}
