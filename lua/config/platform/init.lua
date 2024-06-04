local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == "Darwin"
_G.IS_LINUX = OS == "Linux"
_G.IS_WINDOWS = OS:find("Windows") and true or false
_G.IS_WSL = IS_LINUX and uname.release:find("Microsoft") and true or false

if _G.IS_WINDOWS then
  return require("config/platform/windows")
elseif _G.IS_MAC then
  return require("config/platform/macos")
elseif _G.IS_LINUX then
  return require("config/platform/linux")
end
