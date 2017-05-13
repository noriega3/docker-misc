Write-Host "Starting Virtual Radar Server ..."
$FilePath = "c:\Program Files (x86)\VirtualRadar\VirtualRadar.exe"
$UsersExists = Test-Path C:\Data\Users.sqb

If ($UsersExists -eq $False) {
    Start-Process -FilePath $FilePath -ArgumentList '-nogui','-workingfolder:C:\Data','-createAdmin:admin','-password:admin' -Wait
}
Else {
    Start-Process -FilePath $FilePath -ArgumentList '-nogui','-workingfolder:C:\Data' -Wait
}