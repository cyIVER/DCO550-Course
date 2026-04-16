# Packer template for DCO 550 Hunter/Forensics Workstation
# Author: Principal Cloud Architect

packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 2"
    }
  }
}

variable "client_id" { type = string }
variable "client_secret" { type = string, sensitive = true }
variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

source "azure-arm" "hunter" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  managed_image_resource_group_name = "dco550-images-rg"
  managed_image_name                = "dco550-hunter-win11-v1"

  os_type         = "Windows"
  image_publisher = "MicrosoftWindowsDesktop"
  image_offer     = "windows-11"
  image_sku       = "win11-22h2-pro"

  communicator   = "winrm"
  winrm_use_ssl  = true
  winrm_insecure = true
  winrm_username = "packer"

  azure_tags = {
    course = "DCO550"
    role   = "Forensics-Analysis"
    triad  = "Forensics-RE-DataScience"
  }

  location = "East US"
  vm_size  = "Standard_D4s_v3"
}

build {
  sources = ["source.azure-arm.hunter"]

  # Phase 1: Security Gating & Foundation
  provisioner "powershell" {
    inline = [
      "Write-Host 'Disabling Windows Defender to prevent interference with RE tools...'",
      "Set-MpPreference -DisableRealtimeMonitoring $true",
      "Set-MpPreference -DisableIOAVProtection $true",
      "Set-MpPreference -DisableBehaviorMonitoring $true",
      "Set-MpPreference -DisableScriptScanning $true",
      "Set-MpPreference -EnableControlledFolderAccess Disabled",
      "Add-MpPreference -ExclusionPath 'C:\\'",
      
      "Write-Host 'Installing Chocolatey Package Manager...'",
      "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    ]
  }

  # Phase 2: Modern Hunter's Triad Toolset (Forensics + RE + Data Science)
  provisioner "powershell" {
    inline = [
      "Write-Host 'Installing Forensic and Reverse Engineering tools...'",
      "choco install ghidra x64dbg.portable volatility pestudio wireshark sysinternals python3 vscode -y",
      "choco install plaso -y",
      
      "Write-Host 'Configuring Python Data Science Environment for Threat Hunting...'",
      "& \"C:\\Python312\\python.exe\" -m pip install --upgrade pip",
      "& \"C:\\Python312\\python.exe\" -m pip install pandas numpy matplotlib scikit-learn jupyter msticpy requests",
      
      "Write-Host 'Downloading static tools...'",
      "New-Item -ItemType Directory -Force -Path 'C:\\Tools'",
      "Invoke-WebRequest -Uri 'https://github.com/ericzimmerman/Get-ZimmermanTools/raw/master/Get-ZimmermanTools.zip' -OutFile 'C:\\Tools\\ZimmermanTools.zip'"
    ]
  }

  # Phase 3: Sysprep for Azure Image Generalization
  provisioner "powershell" {
    inline = [
      "Write-Host 'Generalizing image with Sysprep...'",
      "& $env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oere /generalize /quiet /quit /mode:vm",
      "while($true) { $p = Get-Process sysprep -ErrorAction SilentlyContinue; if(!$p) { break; } Start-Sleep -Seconds 5 }"
    ]
  }
}
