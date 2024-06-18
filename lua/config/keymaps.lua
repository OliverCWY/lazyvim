-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local map_key = vim.api.nvim_set_keymap
local delmap = vim.keymap.del

local all = { "n", "v", "i", "x", "t" }
local nv = { "n", "v" }
local nt = { "n", "t" }
local n = "n"
local v = "v"
map(nv, ";", ":")
-- map(nv, "q", "<cmd>bd<cr>")
-- map(all, "<c-q>", "<cmd>qall<cr>")
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
      dir = ocwy.cwd,
    })
    mode = 1
  end
end)

local h_size = 15
local v_size = 50
local modes = all
for _, m in ipairs(nt) do
  vim.api.nvim_del_keymap(m, "<C-/>")
  vim.api.nvim_del_keymap(m, "<C-_>")
end

map(modes, "<C-M-T>", function()
  ocwy.vertical:toggle(v_size, "vertical")
end, {
  desc = "Toggle Vertical Terminal",
  silent = true,
})

map(modes, "<C-T>", function()
  ocwy.horizontal:toggle(h_size, "horizontal")
end, {
  desc = "Toggle Horizontal Terminal",
  silent = true,
})

map(modes, "<C-/>", function()
  ocwy.floating:toggle()
end, {
  desc = "Toggle Floating Terminal",
  silent = true,
})

map(modes, "<C-_>", function()
  ocwy.floating:toggle()
end, {
  desc = "which_key_ignore",
  silent = true,
})
--
--
-- function ocwy_test1()
--   for _, imap in ipairs(vim.api.nvim_get_keymap("n")) do
--     -- vim.print(imap)
--     local desc = imap.desc or ""
--     if string.find(imap.lhs, "C-/") then
--       vim.print(imap)
--       -- remove(nt, imap.lhs)
--     end
--   end
-- end
