# Business Case: DCO 550 - Advanced Adversary Hunting & Malware RE

## 1. Executive Summary
This document outlines the resource requirements, financial projections, and security considerations for **DCO 550: Advanced Adversary Hunting & Malware Reverse Engineering**. 

The course is structured as a **16-week semester**, consisting of two 1.5-hour instructional blocks per week (Tuesdays/Thursdays). To deliver this high-fidelity training experience for a maximum of **12 students per cohort**, the course requires a dedicated Azure-based cyber range, specialized forensic software, and specific network policy exceptions to handle live malware samples safely.

## 2. Strategic Alignment
DCO 550 aligns with corporate objectives to mature our internal threat hunting capabilities and improve incident response dwell times. By adopting the **Modern Hunter's Triad** (Forensics, RE, and Data Science), we ensure our personnel are equipped with the skills to identify advanced persistent threats (APTs) that bypass traditional signature-based defenses.

## 3. Resource Requirements

### 3.1 Financial Projections (Cloud Infrastructure)
*Estimated for a 16-week semester (2 x 1.5hr sessions/week) for 12 students.*
*Cost assumes automated deallocation of VMs outside of class/lab hours.*

| Item | Description | Estimated Cost (Semester) |
| :--- | :--- | :--- |
| **Azure Compute** | 48 VMs (4 per student). Dynamic scaling/scheduled shutdown. | $1,800 - $2,400 |
| **Storage** | Managed Disks (Persistent across 16 weeks). | $1,200 - $1,500 |
| **Sentinel Ingestion** | Lab telemetry for 32 instructional sessions. | $300 - $500 |
| **Track 1 Hosting** | Persistent Course Website. | $200 - $300 |
| **Total Semester Budget** | | **$3,500 - $4,700** |

### 3.2 Software & Licensing
*   **Operating Systems**: Windows 11 Enterprise & Windows Server 2022 (Azure Gallery Images).
*   **Security Stack**: Microsoft 365 E5 or Microsoft Defender for Endpoint (MDE) P2.
*   **RE Toolset**: Ghidra, x64dbg, Volatility 3, Plaso (Open-source/No-cost).
*   **Data Science**: Python 3.12, Pandas, MSTICPy (Open-source/No-cost).

### 3.3 Personnel & Sustainment Model
*   **Sustainment Team**: **Internal Hunt Team Personnel**.
*   **Role**: The Hunt Team will act as both SMEs and Infrastructure Maintainers. This ensures the course content evolves alongside current real-world threats encountered by the team.
*   **Commitment**: ~4 hours/week per designated Hunt Team member for lab maintenance and instructional support.

## 4. Operational & Network Policy Exceptions
Due to the nature of malware analysis, the following exceptions to standard corporate IT policy are requested for the **DCO 550 Azure Environment**:

1.  **Malware Execution Authorization**: Approval to store and execute known malware samples within the strictly isolated `172.16.X.0/24` student subnets.
2.  **Proxy Bypass/Whitelisting**: The GitLab CI/CD Runners require outbound access to `management.azure.com` and `github.com` via the corporate proxy.
3.  **MDE Telemetry Egress**: All lab nodes must be permitted to communicate with Microsoft Defender for Endpoint cloud endpoints to maintain the "Hunter's Triad" telemetry stream.
4.  **Browser-Based RDP**: Port `443` (HTTPS) must be accessible from the corporate LAN to the Azure Guacamole Gateway to allow student access.

## 5. Risk Mitigation & Security Controls
*   **Infrastructure as Code (IaC)**: Labs are immutable. Any compromised node is destroyed and redeployed via Terraform in minutes.
*   **Zero-Trust Networking**: Student subnets are isolated from each other and the corporate backbone via Azure Network Security Groups (NSGs).
*   **Data Generalization**: Packer-built "Golden Images" ensure no sensitive corporate data is ever introduced into the malware analysis environment.

---
**Prepared By**: Iver Iverson
**Date**: April 16, 2026
**Status**: DRAFT FOR APPROVAL
