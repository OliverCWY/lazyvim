local uname = vim.loop.os_uname()
local use_nushell = false

if vim.fn.executable("nu") == 1 then
  vim.o.shell = "nu"
  vim.o.shellcmdflag = "-c"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
  use_nushell = true
end

_G.OS = uname.sysname
_G.IS_MAC = OS == "Darwin"
_G.IS_LINUX = OS == "Linux"
_G.IS_WINDOWS = OS:find("Windows") and true or false
_G.IS_WSL = IS_LINUX and uname.release:find("Microsoft") and true or false

if _G.IS_WINDOWS then
  return require("config/platform/windows")({ use_nushell = use_nushell })
elseif _G.IS_MAC then
  return require("config/platform/macos")({ use_nushell = use_nushell })
elseif _G.IS_LINUX then
  return require("config/platform/linux")({ use_nushell = use_nushell })
end
