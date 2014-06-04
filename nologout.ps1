$fullFileName = $True
While ($fullFileName -eq $True){
$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Wildstar')
Sleep 1
$wshell.SendKeys(' ')
Sleep 60
}