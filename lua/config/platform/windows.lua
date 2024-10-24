return function(config)
  if not config.use_nushell then
    local is_posh = false
    if vim.fn.executable("pwsh") == 1 then
      vim.o.shell = "pwsh"
      is_posh = true
    elseif vim.fn.executable("powershell") == 1 then
      vim.o.shell = "powershell"
      is_posh = true
    end

    if is_posh then
      vim.o.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
      vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
      vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
      vim.o.shellquote = ""
      vim.o.shellxquote = ""
    end
  end
end
