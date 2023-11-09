function downloadFiles {
    # Download actie
    $url = "https://heiperavddeployment.blob.core.windows.net/deploymentprd/Microsoft Office/setup.exe"
    $dest = "C:\Deployment\Microsoft Office\setup.exe"
    Invoke-WebRequest -Uri $url -OutFile $dest
    $url = "https://heiperavddeployment.blob.core.windows.net/deploymentprd/Microsoft Office/Windows Virtual Desktop - Default Office Configuration - NL-NL.xml"
    $dest = "C:\Deployment\Microsoft Office\Windows Virtual Desktop - Default Office Configuration - NL-NL.xml"
    Invoke-WebRequest -Uri $url -OutFile $dest
}

function InstallOffice {
    Set-Location -Path 'C:\Deployment\Microsoft Office\'
    Write-Host "Microsoft Office wordt gedownload"
    .\setup.exe /download '.\Windows Virtual Desktop - Default Office Configuration - NL-NL.xml'
    Write-Host "Microsoft office wordt geinstalleerd"
    .\setup.exe /configure '.\Windows Virtual Desktop - Default Office Configuration - NL-NL.xml'
}

downloadFiles
InstallOffice