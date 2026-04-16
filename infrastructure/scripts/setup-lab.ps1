# Post-Deployment Automation for DCO 550 Cyber Range
# Author: Principal Cloud Architect

<#
.SYNOPSIS
    This script automates the promotion of the Domain Controller and the 
    subsequent domain-join of the Target and Hunter nodes.
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$Role, # "DC" or "Client"
    [string]$DomainName = "dco550.local",
    [string]$AdminPass = "P@ssword123!"
)

function Install-DC {
    Write-Host "Starting Domain Controller Promotion..."
    Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
    
    $SecurePass = ConvertTo-SecureString $AdminPass -AsPlainText -Force
    
    Import-Module ADDSDeployment
    Install-ADDSForest `
        -DomainName $DomainName `
        -SafeModeAdministratorPassword $SecurePass `
        -InstallDns:$true `
        -CreateDnsDelegation:$false `
        -DatabasePath "C:\Windows\NTDS" `
        -LogPath "C:\Windows\NTDS" `
        -SysvolPath "C:\Windows\SYSVOL" `
        -Force:$true `
        -NoRebootOnCompletion:$false
}

function Join-Domain {
    Write-Host "Joining machine to domain $DomainName..."
    
    # Wait for DC to be reachable
    $dcIp = "172.16.1.10" # This should be dynamically set or handled via DNS
    while (!(Test-Connection -ComputerName $dcIp -Count 1 -Quiet)) {
        Write-Host "Waiting for DC ($dcIp) to be online..."
        Start-Sleep -Seconds 10
    }

    $SecurePass = ConvertTo-SecureString $AdminPass -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential ("Administrator", $SecurePass)
    
    Add-Computer -DomainName $DomainName -Credential $cred -Restart -Force
}

# --- Execution Logic ---

if ($Role -eq "DC") {
    Install-DC
} elseif ($Role -eq "Client") {
    Join-Domain
} else {
    Write-Error "Invalid Role specified. Use 'DC' or 'Client'."
}
