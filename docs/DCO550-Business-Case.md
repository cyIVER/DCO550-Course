# Business Case: DCO 550 - Advanced Adversary Hunting & Malware RE

## 1. Executive Summary
This document outlines the resource requirements, financial projections, and security considerations for **DCO 550: Advanced Adversary Hunting & Malware Reverse Engineering**. To deliver a high-fidelity, enterprise-grade training experience, the course requires a dedicated Azure-based cyber range, specialized forensic software, and specific network policy exceptions to handle live malware samples safely.

## 2. Strategic Alignment
DCO 550 aligns with corporate objectives to mature our internal threat hunting capabilities and improve incident response dwell times. By adopting the **Modern Hunter's Triad** (Forensics, RE, and Data Science), we ensure our personnel are equipped with the skills to identify advanced persistent threats (APTs) that bypass traditional signature-based defenses.

## 3. Resource Requirements

### 3.1 Financial Projections (Cloud Infrastructure)
*Estimated for a class of 20 students over a 5-day intensive period.*

| Item | Description | Estimated Cost (Total) |
| :--- | :--- | :--- |
| **Azure Compute** | 80 VMs (4 per student) using D-Series v3 instances. | $3,500 - $4,200 |
| **Storage** | Premium SSDs for forensic image analysis. | $600 - $800 |
| **Sentinel Ingestion** | 100GB total telemetry ingestion for KQL hunting labs. | $400 - $600 |
| **GCP/Azure Web App** | Hosting for Track 1 Course Materials. | $50 - $100 |
| **Total Class Budget** | | **$4,550 - $5,700** |

### 3.2 Software & Licensing
*   **Operating Systems**: Windows 11 Enterprise & Windows Server 2022 (Azure Gallery Images).
*   **Security Stack**: Microsoft 365 E5 or Microsoft Defender for Endpoint (MDE) P2.
*   **RE Toolset**: Ghidra, x64dbg, Volatility 3, Plaso (Open-source/No-cost).
*   **Data Science**: Python 3.12, Pandas, MSTICPy (Open-source/No-cost).

### 3.3 Personnel
*   **Primary Instructor**: Subject Matter Expert (SME) in Malware/Forensics.
*   **Cloud Architect (0.25 FTE)**: Infrastructure maintenance and CI/CD orchestration.
*   **Lab Assistant (0.5 FTE)**: Real-time student support during technical exercises.

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
