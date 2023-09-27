$x = Split-Path -Parent $MyInvocation.MyCommand.Definition #get current path
$Log = "$x\Logs\" + $env:computername + ".txt" #set log file address

Get-localuser administrator | out-file $Log -Force

#Run with administrator permission
$user = "administrator"
$passwd = Read-Host "Enter $user password" -AsSecureString
$encpwd = ConvertFrom-SecureString $passwd

# Afterwards always use this to start the script
$passwd = ConvertTo-SecureString $encpwd
$cred = new-object System.Management.Automation.PSCredential $user,$passwd

try{
      Start-Process $env:windir\System32\WindowsPowerShell\v1.0\powershell.exe -Credential $cred -argument "powershell start-process cmd -verb runas" | out-file $Log -Append
    }
     catch
{
     $_ | out-file $Log -Append 
}
