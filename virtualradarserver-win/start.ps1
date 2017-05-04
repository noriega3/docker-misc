Write-Host "Starting Virtual Radar Server ..."
$FilePath = "c:\Program Files (x86)\VirtualRadar\VirtualRadar.exe"
$UsersExists = Test-Path C:\Users\ContainerAdministrator\AppData\Local\VirtualRadar\Users.sqb

If ($UsersExists -eq $False) {
    Start-Process -FilePath $FilePath -ArgumentList '-nogui','-createAdmin:admin','-password:admin' -Wait
}
Else {
    Start-Process -FilePath $FilePath -ArgumentList '-nogui' -Wait
}