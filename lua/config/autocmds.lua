-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd
local augroup = function(prefix, name, options)
  return vim.api.nvim_create_augroup(prefix .. name, options)
end

autocmd("VimEnter", {
  group = augroup("lazynvim", "update_plugins", { clear = true }),
  callback = function()
    -- require("lazy").update()
    if require("lazy.status").has_updates() then
      require("lazy").update({ show = true })
    end
    -- require("lazy").clean()
  end,
})

autocmd("VimEnter", {
  group = augroup("olivercwy", "auto_cd", { clear = true }),
  callback = function()
    local dir = LazyVim.root()
    ocwy.cwd = vim.uv.cwd()
    -- -- buffer is a directory
    -- local directory = vim.fn.isdirectory(data.file) == 1
    --
    -- -- buffer is a [No Name]
    -- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    --
    -- if no_name then
    --   return
    -- end
    --
    -- if not directory then
    --   directory = require("utils").get_parent_path(data.file)
    -- else
    --   directory = data.file
    -- end

    vim.cmd.cd(dir)
    -- require("neo-tree.command").execute({ toggle = true, dir = dir })

    -- require("nvim-tree.api").tree.open()
  end,
})
