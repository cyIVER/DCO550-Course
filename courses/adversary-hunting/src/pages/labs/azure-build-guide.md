---
layout: ../../layouts/MarkdownLayout.astro
title: "Lab 1: Azure Cyber Range Build Guide"
---

## 1.0 Objective

The objective of this guide is to construct a secure, isolated, and reproducible cloud-native cyber range within Microsoft Azure. This environment will serve as the foundation for all hands-on labs in DCO 550, providing a realistic and safe platform to analyze malware and hunt for advanced adversaries. By the end of this guide, you will have deployed a multi-tier virtual network containing forensics, malware analysis, and victim virtual machines, all governed by strict network security rules.

## 2.0 Architectural Overview

We will build a single Virtual Network (VNet) segmented into three distinct subnets, each with its own Network Security Group (NSG) acting as a firewall. This architecture is crucial for isolating our analysis and victim machines.

- **Analysis Subnet (`10.55.1.0/24`)**: The "clean" zone for our forensics and management VM.
- **Victim Subnet (`10.55.10.0/24`)**: The simulated corporate network where our target machines reside. Outbound internet access is **Denied**.
- **Malware Subnet (`10.55.20.0/24`)**: A high-security "blast chamber" for running and analyzing malware. **Denies all traffic in and out by default.**

---

## 3.0 Automated Deployment (Recommended)

We provide a Bicep template to automate the creation of the Resource Group, VNet, Subnets, and NSGs with the correct security rules.

### Deployment via Azure CLI:
```bash
# Login to Azure
az login

# Create the Resource Group
az group create --name CYS550-Lab-RG --location eastus2

# Deploy the Infrastructure
az deployment group create --resource-group CYS550-Lab-RG --template-file ./infrastructure/main.bicep
```

---

## 4.0 Step-by-Step Deployment Instructions

Follow these phases in order. All resources must be created in the **same region** (e.g., `East US 2`).

### Phase 1: Foundational Infrastructure

1.  **Create Resource Group**: `CYS550-Lab-RG`
2.  **Create Virtual Network**: `CYS550-VNet` (Address space: `10.55.0.0/16`)
3.  **Define Subnets**:
    | Name | Address range |
    | :--- | :--- |
    | `Analysis-Subnet` | `10.55.1.0/24` |
    | `Victim-Subnet` | `10.55.10.0/24` |
    | `Malware-Subnet` | `10.55.20.0/24` |

### Phase 2: Network Security Controls

1.  **Create Network Security Groups (NSGs)**: `Analysis-NSG`, `Victim-NSG`, `Malware-NSG`.
2.  **Configure Victim-NSG**: Add outbound rule `Deny-Internet-Outbound` (Priority 400).
3.  **Configure Malware-NSG**: Add outbound rule `Deny-All-Outbound` (Priority 400).

### Phase 3: Virtual Machine Deployment

| VM Name | Image | Subnet | Size |
| :--- | :--- | :--- | :--- |
| `Analysis-VM` | Ubuntu Server 20.04 LTS | Analysis | `Standard_D4s_v3` |
| `Malware-VM` | Windows 10 Pro | Malware | `Standard_D4s_v3` |
| `DC01` | Win Server 2019 | Victim | `Standard_D2s_v3` |
| `WKSTN-01` | Windows 10 Pro | Victim | `Standard_D2s_v3` |

### Phase 4: Post-Deployment Configuration

1.  **Configure Analysis-VM**:
    ```bash
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install -y git python3-pip
    pip3 install volatility3 pandas numpy scikit-learn
    ```
2.  **Configure Malware-VM**: Temporarily allow outbound traffic to install **Flare-VM**, then immediately revert to **Deny**.
3.  **Configure Victim Network**: Promote `DC01` to a domain controller for `adversary.local` and join `WKSTN-01` to the domain.

---

## 5.0 Operational Procedures

*   **COST MANAGEMENT**: Stop and **Deallocate** VMs when not in use.
*   **DATA TRANSFER**: Never move malware to your host machine. Use the `Analysis-VM` as a bridge.
