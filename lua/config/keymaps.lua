-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local all = { "n", "v", "i", "x" }
local nv = { "n", "v" }
local n = "n"
local v = "v"
-- local map_key = vim.api.nvim_set_keymap
map(nv, ";", ":")
map(nv, "q", "<cmd>bd<cr>")
map(all, "<c-q>", "<cmd>qall<cr>")
-- map({ "n", "i" }, "<c-a>", "<esc>ggVG")
map(v, "<tab>", ">gv")
map(v, "<s-tab>", "<gv")
map(n, "<tab>", ">>")
map(n, "<s-tab>", "<<")

local mode = 0
map(nv, "<leader>fe", function()
  local execute = require("neo-tree.command").execute
  if mode == 2 then
    execute({
      action = "close",
    })
    mode = 0
  else
    execute({
      action = "show",
      dir = LazyVim.root(),
    })
    mode = 2
  end
end)
map(nv, "<leader>fE", function()
  local execute = require("neo-tree.command").execute
  if mode == 1 then
    execute({
      action = "close",
    })
    mode = 0
  else
    execute({
      action = "show",
      dir = _G.ocwy_cwd,
    })
    mode = 1
  end
end)
