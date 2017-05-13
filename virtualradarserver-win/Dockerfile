FROM microsoft/dotnet-framework:4.6.2

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV SOURCE "http://www.virtualradarserver.co.uk/Files/Preview"

RUN wget $env:SOURCE/VirtualRadarSetup.exe -OutFile C:\Windows\Temp\VirtualRadarSetup.exe ; \
     C:\Windows\Temp\VirtualRadarSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\VirtualRadarSetup.exe -Force ; \
    wget $env:SOURCE/DatabaseWriterPluginSetup.exe -OutFile C:\Windows\Temp\DatabaseWriterPluginSetup.exe ; \
     C:\Windows\Temp\DatabaseWriterPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\\Windows\Temp\DatabaseWriterPluginSetup.exe -Force ; \
    wget $env:SOURCE/CustomContentPluginSetup.exe -OutFile C:\Windows\Temp\CustomContentPluginSetup.exe ; \
     C:\Windows\Temp\CustomContentPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\CustomContentPluginSetup.exe -Force ; \
    wget $env:SOURCE/DatabaseEditorPluginSetup.exe -OutFile C:\Windows\Temp\DatabaseEditorPluginSetup.exe ; \
     C:\Windows\Temp\DatabaseEditorPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\DatabaseEditorPluginSetup.exe -Force ; \
    wget $env:SOURCE/FeedFilterPluginSetup.exe -OutFile C:\Windows\Temp\FeedFilterPluginSetup.exe ; \
     C:\Windows\Temp\FeedFilterPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\FeedFilterPluginSetup.exe -Force ; \
    wget $env:SOURCE/WebAdminPluginSetup.exe -OutFile C:\Windows\Temp\WebAdminPluginSetup.exe ; \
     C:\Windows\Temp\WebAdminPluginSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOICONS | Out-Null ; \
    Remove-Item C:\Windows\Temp\WebAdminPluginSetup.exe -Force

ADD ["./logos.tar.gz","C:/Program Files (x86)/VirtualRadar/Flags"]
ADD ["./sideviews.tar.gz","C:/Program Files (x86)/VirtualRadar/Silhouettes"]

EXPOSE 80
VOLUME C:/Data
COPY start.ps1 /
ENTRYPOINT ["powershell","-File","C:\\start.ps1"]