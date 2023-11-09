function AddDeploymentTree {
    New-Item -Path "C:\Deployment" -Name "Experience indicator" -ItemType "directory" -Force
    New-Item -Path "C:\Deployment" -Name "Paping" -ItemType "directory"
    New-Item -Path "C:\Deployment" -Name "Default settings" -ItemType "directory"
    New-Item -Path "C:\Deployment" -Name "Microsoft office" -ItemType "directory"

}

AddDeploymentTree