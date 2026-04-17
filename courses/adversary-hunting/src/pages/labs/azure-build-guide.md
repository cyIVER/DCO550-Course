---
layout: ../../layouts/MarkdownLayout.astro
title: "Mission 01: Establishing the Beachhead"
---

## MISSION 01: Establishing the Beachhead (Azure Cyber Range Build)

### 1.0 MISSION OBJECTIVE

Establish a secure, isolated, and reproducible tactical cyber range within Microsoft Azure. This environment is your **Area of Operations (AO)** for all hands-on exercises in Operation Adversary Hunt. Success is defined by the verified deployment of a multi-tier virtual network with strict egress controls and forensics-ready workstations.

---

### 2.0 INTEL: ARCHITECTURAL OVERVIEW

The tactical range utilizes a single Virtual Network (VNet) segmented into three distinct zones of control:

* **GREEN ZONE // Analysis (`10.55.1.0/24`)**: Clean zone for forensics and command VMs.
* **YELLOW ZONE // Victim (`10.55.10.0/24`)**: Simulated target network. **INTERNET EGRESS: DENIED.**
* **RED ZONE // Malware (`10.55.20.0/24`)**: High-security blast chamber for live-fire RE. **TOTAL ISOLATION.**

---

### 3.0 EXECUTION: DEPLOYMENT PHASES

#### PHASE 1: Infrastructure as Code

Deploy the foundational network using the provided Bicep template.

```bash
# Authenticate to C2
az login

# Establish Resource Group
az group create --name DCO550-AO --location eastus

# Deploy Network Infrastructure
az deployment group create --resource-group DCO550-AO --template-file ./infrastructure/main.bicep
```

#### PHASE 2: Provisioning Assets

Ensure the following tactical assets are provisioned and responding to ICMP:

| ASSET | SPEC | ZONE | PURPOSE |
| :--- | :--- | :--- | :--- |
| **HUNTER-01** | Win 11 Pro | Analysis | Forensics Workstation |
| **MALWARE-01** | Win 10 (Air-Gapped) | Malware | Reverse Engineering Lab |
| **TARGET-DC** | Win Server 2022 | Victim | Domain Controller |
| **TARGET-WK01** | Win 11 Pro | Victim | Compromised Endpoint |

---

### 4.0 OPERATIONAL READINESS CHECK (ORC)

> **OPERATIONAL WARNING**
> Failure to verify the "Victim" zone's internet isolation can result in unintended C2 beaconing to the public internet during later labs. Do not proceed until isolation is confirmed.

#### Check 1: Egress Verification

From **TARGET-WK01**, attempt to ping `8.8.8.8`.

* **Expected Result:** `Request timed out` (Isolation Confirmed).

#### Check 2: Tooling Baseline

From **HUNTER-01**, verify the presence of the following binaries:

* `vol.py` (Volatility 3)
* `ghidraRun` (Ghidra 11.x)
* `pestudio.exe`

---

### 5.0 MISSION COMPLETION CRITERIA

1. Resource Group `DCO550-AO` is active.
2. All 4 VMs are in a "Running" state.
3. Victim subnet isolation verified via ping failure.
4. Submit your `az resource list --output table` output to the instructor for phase sign-off.
