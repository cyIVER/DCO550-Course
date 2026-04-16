# DCO 550 Infrastructure-as-Code (IaC)

This directory contains the automation and configuration code for the DCO 550 Cyber Range and Course Platform.

## Directory Structure

- `packer/`: HashiCorp Packer templates for building "Golden Images" (e.g., the Hunter/Forensics workstation).
- `terraform/`: HashiCorp Terraform configurations for provisioning Azure resources (VNets, Subnets, VMs, Sentinel).
- `scripts/`: PowerShell and Bash scripts for post-deployment configuration and automation.

## Usage

### 1. Build Golden Images
```bash
cd packer
packer init .
packer build .
```

### 2. Provision Cyber Range
```bash
cd terraform
terraform init
terraform apply -var="student_num=1"
```

## Track Details

- **Track 1**: Containerized course website deployed to Azure App Service / Cloud Run.
- **Track 2**: Multi-node Windows Cyber Range on Azure for forensics and malware analysis.

---
**Author**: Principal Cloud Architect
