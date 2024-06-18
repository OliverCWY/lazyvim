return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
      autochdir = true,
    },
    dependencies = {
      "LazyVim/LazyVim",
    },
    init = function()
      local terminal = require("toggleterm.terminal").Terminal
      ocwy.horizontal = terminal:new({
        direction = "horizontal",
        hidden = true,
      })
      ocwy.vertical = terminal:new({
        direction = "vertical",
        hidden = true,
      })
      ocwy.floating = terminal:new({
        direction = "float",
        hidden = true,
      })
    end,
  },
}
