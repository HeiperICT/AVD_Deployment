Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

function OutlookSignIn {
    Add-AppxPackage -Register "C:\Windows\SystemApps\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy\Appxmanifest.xml" -DisableDevelopmentMode

}

function frxtrayshortcut {
    $TargetFile = "C:\Program Files\FSLogix\Apps\frxtray.exe"
    $ShortcutFile = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\frxtray.lnk"
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath = $TargetFile
    $Shortcut.Save()    
}


#deze aanpassen incl download
function ExperienceIndicator {
    # Download actie
    $url = "https://heiperavddeployment.blob.core.windows.net/deploymentprd/Experience Indicator/ExperienceIndicator.exe"
    $dest = "C:\Deployment\Experience indicator\ExperienceIndicator.exe"
    Invoke-WebRequest -Uri $url -OutFile $dest
    # Snelkoppeling
    $TargetFile = "C:\Deployment\Experience indicator\ExperienceIndicator.exe"
    $ShortcutFile = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ExperienceIndicator.lnk"
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath = $TargetFile
    $Shortcut.Save()
}


function paping {
    # Download actie
    $url = "https://heiperavddeployment.blob.core.windows.net/deploymentprd/Paping/paping.exe"
    $dest = "C:\Deployment\Paping\paping.exe"
    Invoke-WebRequest -Uri $url -OutFile $dest
    # Kopier actie
    Copy-Item "C:\Deployment\Paping\paping.exe" C:\Windows\System32\paping.exe
}

function signoutbutton {
    # Download actie
    $url = "https://heiperavddeployment.blob.core.windows.net/deploymentprd/SignOut/Afmelden.lnk"
    $dest = "C:\Deployment\Default settings\Afmelden.lnk"
    Invoke-WebRequest -Uri $url -OutFile $dest
    # Kopier actie    
    Copy-Item "C:\Deployment\Default settings\Afmelden.lnk" "C:\Users\Public\Desktop\Afmelden.lnk"
}

function defaultapps {
    winget install -e -h --id VideoLAN.VLC
    winget install -e -h --id 7zip.7zip
    winget install -e -h --id Google.Chrome
    winget install -e -h --id Adobe.Acrobat.Reader.64-bit
    winget install -e -h --id Notepad++.Notepad++
}

OutlookSignIn
frxtrayshortcut
ExperienceIndicator
paping
signoutbutton
defaultapps