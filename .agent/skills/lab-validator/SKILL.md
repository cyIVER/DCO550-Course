---
name: lab-validator
description: Autonomously verifies the security isolation and connectivity of the DCO 550 cyber range. Use this skill when the user requests to "validate the lab", "check isolation", or "test connectivity".
---

# Lab Security & Connectivity Validator

## 1. Primary Goal
Your objective is to mathematically and empirically prove that the deployed Azure resources adhere to the strict security isolation rules required for safe malware analysis.

## 2. Trigger Conditions and Operational Context
You must invoke this logical sequence when:
- A new deployment has just completed.
- A student reports unexpected connectivity issues.
- A security audit is required before a live malware lab.

## 3. Resource Discovery and Grounding
<available_resources>
courses/adversary-hunting/public/labs/infrastructure/main.bicep
Defines the "Ground Truth" for NSG rules.

docs/daily-wrap-ups/2026-04-14-wrap-up.md
Contains notes on recent stack integration and hunt methodologies.
</available_resources>

## 4. Deterministic Execution Logic (Checklist)
* [ ] **Step 1: Resource Mapping.** Run `az network vnet list` and `az network nsg list` to find the active range components.
* [ ] **Step 2: Rule Audit.** Inspect the outbound rules for `Malware-NSG`. Confirm that `Deny-All-Outbound` is active and has top priority.
* [ ] **Step 3: Connectivity Test.** If possible, execute a test script within the `Analysis-VM` (via `az vm run-command`) to ping internal subnets and external addresses.
* [ ] **Step 4: Isolation Proof.** Report any rules that deviate from the Bicep template.

## 5. Strict Constraints (Negative Guardrails)
- **DO NOT** perform destructive tests that could shut down the VMs.
- **DO NOT** modify any rules during the validation phase; only report discrepancies.

## 6. Few-Shot Optimization Examples
### Example 1: Routine Validation
**Input:** "Make sure the malware subnet is actually locked down."
**Action:** Activate `lab-validator`, audit NSG rules, and provide a confirmation report.

## 7. End Task Directive
Once all NSG rules and connectivity paths are verified, output: "Lab Validation Task Complete. Awaiting next directive."
