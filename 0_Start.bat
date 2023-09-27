@Echo Off
REM Bat script start Powershell script
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -file "%~dp0Reset-AdminPass.ps1"
timeout 5 > NUL
