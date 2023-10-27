[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 
choco install 7zip.install -y
choco install vlc -y
choco install googlechrome -y
choco install adobereader -y
choco install notepadplusplus -y