-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
require("config/platform")
local opt = vim.opt
opt.relativenumber = false
vim.o.guifont = "ComicShannsMono Nerd Font:h12"
