local not_cmd = true
if vim.fn.executable("pwsh") == 1 then
  vim.o.shell = "pwsh"
elseif vim.fn.executable("powershell") == 1 then
  vim.o.shell = "powershell"
else
  not_cmd = false
end

if not_cmd then
  vim.o.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
