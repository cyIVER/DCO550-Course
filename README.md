# DCO 550: Advanced Adversary Hunting & Malware Reverse Engineering

This repository contains the complete source code, infrastructure, and educational materials for the **DCO 550** course. The platform is designed to provide a high-fidelity, enterprise-grade environment for mastering forensics, malware analysis, and data-driven threat hunting.

## 🏹 The Modern Hunter's Triad
The course architecture is built around the "Hunter's Triad" concept, integrating three critical domains into a unified lab experience:
1.  **Forensics & Artifact Analysis**: Deep-dive into Windows internals and filesystem forensics.
2.  **Reverse Engineering**: Behavioral and static analysis of modern malware.
3.  **Data Science for Hunting**: Leveraging Python, Pandas, and KQL to identify anomalies at scale.

## 🏗️ Project Structure

- `courses/adversary-hunting/`: Tactical C2-style mission platform (Astro) with integrated progress tracking, operator checklists, and an instructor C2 dashboard.
- `infrastructure/`: Enterprise-grade Infrastructure as Code (IaC).
    - `packer/`: Windows 11 Golden Images pre-instrumented with Ghidra, Volatility 3, x64dbg, and more.
    - `terraform/`: Automated Azure provisioning of isolated student cyber ranges (172.16.X.0/24).
    - `scripts/`: PowerShell DSC and automation for AD Forest creation and domain orchestration.
- `docs/`: Technical research, daily wrap-ups, and lab methodologies.
- `.agent/`: Specialized AI agent personas and skills for automated course maintenance.

## 🚀 DevSecOps & Deployment

- **Mission Briefing Platform**: A hardened web interface featuring "Operational Phases," "Tactical References," and a persistent "Mission Journal" for student documentation.
- **Dual-Track CI/CD**: 
    - **Track 1**: Containerized delivery of the course website via GitHub Actions.
    - **Track 2**: Full-stack infrastructure deployment via GitLab CI/CD with corporate proxy support.
- **Sentinel & MDE Integration**: Every lab node is instrumented with Microsoft Defender for Endpoint and streams telemetry to a centralized Microsoft Sentinel workspace.
- **Isolated Ranges**: Strict egress filtering to ensure safe malware execution within student-specific subnets.

---
**Author**: Iver Iverson  
**System Status**: NOMINAL // OPERATION ADVERSARY HUNT ACTIVE
