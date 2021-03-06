
#Script Disabled Firewall, Enabled Remote Desktop, Install Roles and Features#

Set-ExecutionPolicy Unrestricted
Import-Module Servermanager

Write-Host "Disabaling Firewall" -BackgroundColor DarkGreen
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled False

Write-Host "Enabling Remote Desktop" -BackgroundColor DarkGreen
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0  

Write-Host "Install MultipathIO" -BackgroundColor DarkGreen
Enable-WindowsOptionalFeature -Online -Featurename MultipathIO

Write-Host "Install Failover Cluster" -BackgroundColor DarkGreen
Install-WindowsFeature -Name Failover-Clustering –IncludeManagementTools

Write-Host "Install Hyper-V Role RSAT TOOLS" -BackgroundColor DarkGreen
Add-WindowsFeature RSAT-Hyper-V-Tools –IncludeAllSubFeature

Write-Host NewLine "Install Hyper-V Role" -BackgroundColor DarkGreen
Write-Host NewLine "Computer will restart after install is complete" -BackgroundColor DarkGreen
Install-WindowsFeature Hyper-V


