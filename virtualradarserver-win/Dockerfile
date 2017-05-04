FROM microsoft/dotnet-framework:4.6.2

SHELL ["Powershell.exe"]
RUN $ErrorActionPreference = 'Stop'; \
    MkDir C:\Data | Out-Null ; \
    New-Item -Path C:\Users\ContainerAdministrator\AppData\Local\VirtualRadar -ItemType SymbolicLink -Value C:\Data  | Out-Null ; \
    wget http://www.virtualradarserver.co.uk/Files/Preview/VirtualRadarSetup.exe -OutFile C:\Windows\Temp\VirtualRadarSetup.exe ; \
     C:\Windows\Temp\VirtualRadarSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\VirtualRadarSetup.exe -Force ; \
    wget http://www.virtualradarserver.co.uk/Files/Preview/DatabaseWriterPluginSetup.exe -OutFile C:\Windows\Temp\DatabaseWriterPluginSetup.exe ; \
     C:\Windows\Temp\DatabaseWriterPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\\Windows\Temp\DatabaseWriterPluginSetup.exe -Force ; \
    wget http://www.virtualradarserver.co.uk/Files/Preview/CustomContentPluginSetup.exe -OutFile C:\Windows\Temp\CustomContentPluginSetup.exe ; \
     C:\Windows\Temp\CustomContentPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\CustomContentPluginSetup.exe -Force ; \
    wget http://www.virtualradarserver.co.uk/Files/Preview/DatabaseEditorPluginSetup.exe -OutFile C:\Windows\Temp\DatabaseEditorPluginSetup.exe ; \
     C:\Windows\Temp\DatabaseEditorPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\DatabaseEditorPluginSetup.exe -Force ; \
    wget http://www.virtualradarserver.co.uk/Files/Preview/FeedFilterPluginSetup.exe -OutFile C:\Windows\Temp\FeedFilterPluginSetup.exe ; \
     C:\Windows\Temp\FeedFilterPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\FeedFilterPluginSetup.exe -Force ; \
    wget http://www.virtualradarserver.co.uk/Files/Preview/WebAdminPluginSetup.exe -OutFile C:\Windows\Temp\WebAdminPluginSetup.exe ; \
     C:\Windows\Temp\WebAdminPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\WebAdminPluginSetup.exe -Force ; \
    Remove-Item C:\Data\InstallerConfiguration.xml -Force

ADD ["./logos.tar.gz","C:/Program Files (x86)/VirtualRadar/Flags"]
ADD ["./sideviews.tar.gz","C:/Program Files (x86)/VirtualRadar/Silhouettes"]
VOLUME C:/Data
COPY start.ps1 C:/
ENTRYPOINT ["Powershell.exe","C:\\start.ps1"]