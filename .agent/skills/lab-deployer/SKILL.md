---
name: lab-deployer
description: Autonomously deploys the DCO 550 Azure cyber range infrastructure using Bicep and PowerShell. Use this skill when the user requests to "deploy the lab", "provision the environment", or "setup Azure resources". Do not use for local Docker-only hosting.
---

# Lab Deployment Orchestrator

## 1. Primary Goal
Your objective is to provision a secure, multi-tier Azure virtual network and its associated virtual machines (Analysis, Malware, Victim) to support course lab operations.

## 2. Trigger Conditions and Operational Context
You must invoke this logical sequence when:
- The user requests a fresh deployment of the course infrastructure.
- A lab environment needs to be reset or redeployed from scratch.
- The Cyber Range Engineer persona is active and needs to manifest cloud resources.

## 3. Resource Discovery and Grounding
<available_resources>
deploy.ps1
The unified deployment script that handles environment checks and triggers the Bicep deployment.

courses/adversary-hunting/public/labs/infrastructure/main.bicep
The infrastructure-as-code template defining VNets, Subnets, and NSGs.
</available_resources>

## 4. Deterministic Execution Logic (Checklist)
* [ ] **Step 1: Environment Check.** Execute `.\deploy.ps1` with the "0" option (or check dependencies manually via `az --version` and `Get-Command winget`). Ensure Azure CLI is installed.
* [ ] **Step 2: Authentication.** Run `az account show`. If it fails, instruct the user to run `az login` and wait for confirmation.
* [ ] **Step 3: Configuration.** Ask the user for the Azure Resource Group name and Region, or use the defaults provided in `deploy.ps1` (MoonBase-RG, eastus).
* [ ] **Step 4: Execution.** Execute the deployment logic from `deploy.ps1`. You may run `az deployment group create --resource-group <RG> --template-file <Path>` directly for more control.
* [ ] **Step 5: Validation.** Monitor the Azure CLI output for a "Succeeded" provisioning state.

## 5. Strict Constraints (Negative Guardrails)
- **DO NOT** modify the NSG rules in `main.bicep` to allow internet access to the Malware-VM without explicit instructor overrides.
- **DO NOT** proceed if `az login` has not been completed.
- **DO NOT** create resources in unapproved regions to avoid latency issues.

## 6. Few-Shot Optimization Examples
### Example 1: Triggering Deployment
**Input:** "I need to get the lab ready for Session 1.2."
**Action:** Activate `lab-deployer`, confirm RG name, and initiate Bicep deployment.

## 7. End Task Directive
Once the Azure deployment reports success and the Resource Group is verified, output: "Lab Deployment Task Complete. Awaiting next directive."
