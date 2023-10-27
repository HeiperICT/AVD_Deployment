Write-Host "Checking for elevated permissions..."

#$script = $PSScriptRoot+"\clean_winx.ps1"

if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
[Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Insufficient permissions to run this script. Opening the script as Administrator."
    Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Unrestricted -File "C:\deployment\Winx\clean_winx.ps1"' -Verb RunAs
}else{
    Write-Host "Code is running as administrator — go on executing the script..." -ForegroundColor Green

    $TempPath=$PSScriptRoot+"\temp"

    Write-Host "Checking if $TempPath exists" -ForegroundColor Green

    $folderexist = test-path $TempPath
    if($folderexist = "False"){
        New-Item -Path $PSScriptRoot -Name "temp" -ItemType "directory"
    }
    
    
    
    
    
    $WinXPath="C:\Users\Default\AppData\Local\Microsoft\Windows\WinX"
    $TempPath=$PSScriptRoot+"\temp"

    

    Write-Host "Create back-up of important shortcuts" -ForegroundColor Green
        
    #Save
    Copy-Item "$WinXPath\Group2\3 - Windows Explorer.lnk" -Destination "$TempPath\3 - Windows Explorer.lnk"
    Copy-Item "$WinXPath\Group2\5 - Task Manager.lnk" -Destination "$TempPath\5 - Task Manager.lnk"
    
    


    Write-Host "Removing all items from WinX menu" -ForegroundColor Green
    #Remove
    Remove-Item "$WinXPath\Group2\*.*"
    Remove-Item "$WinXPath\Group3\*.*"

    

    Write-Host "Restoring important items to WinX menu" -ForegroundColor Green
    #Restore
    Copy-Item "$TempPath\3 - Windows Explorer.lnk" -Destination "$WinXPath\Group2\3 - Windows Explorer.lnk"
    Copy-Item "$TempPath\5 - Task Manager.lnk" -Destination "$WinXPath\Group2\5 - Task Manager.lnk"

       

    Write-Host "Cleaning up back-up" -ForegroundColor Green

    Remove-Item $TempPath -Recurse
    
    
}