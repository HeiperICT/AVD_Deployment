Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

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
    Invoke-WebRequest -Uri $url -OutFile ( New-Item -Path $dest -Force )
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
    Invoke-WebRequest -Uri $url -OutFile ( New-Item -Path $dest -Force )
    # Kopier actie
    Copy-Item "C:\Deployment\Paping\paping.exe" C:\Windows\System32\paping.exe
}

function signoutbutton {
    # Download actie
    $url = "https://heiperavddeployment.blob.core.windows.net/deploymentprd/SignOut/Afmelden.lnk"
    $dest = "C:\Deployment\Default settings\Afmelden.lnk"
    Invoke-WebRequest -Uri $url -OutFile ( New-Item -Path $dest -Force )
    # Kopier actie    
    Copy-Item "C:\Deployment\Default settings\Afmelden.lnk" "C:\Users\Public\Desktop\Afmelden.lnk"
}

frxtrayshortcut
ExperienceIndicator
paping
signoutbutton
