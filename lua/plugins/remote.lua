return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim", -- For standard functions
      "MunifTanjim/nui.nvim", -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    -- config = true,
    config = {
      ssh_config = {
        ssh_config_file_paths = { "C:/Users/olive/.ssh/config" },
      },
    },
  },
}
