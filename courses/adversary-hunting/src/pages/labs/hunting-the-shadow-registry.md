---
layout: ../../layouts/MarkdownLayout.astro
title: "Mission 02: Shadow Persistence"
---

## MISSION 02: Shadow Persistence (Registry Analysis)

### 1.0 MISSION OBJECTIVE

Identify and extract advanced persistence mechanisms within the Windows Registry. You will transition from basic triage to deep-dive forensics to uncover "Shadow Keys"—obfuscated registry entries designed to evade standard administrative tools.

---

### 2.0 INTEL: TARGET PROFILE

An adversary has established a foothold on **TARGET-WK01**. Intelligence suggests they are using a combination of traditional Run keys and high-entropy obfuscated values to maintain access across reboots.

**MITRE ATT&CK Mapping:**

* **T1547.001**: Boot or Logon Autostart Execution: Registry Run Keys
* **T1112**: Modify Registry

---

### 3.0 EXECUTION: SEARCH & RECOVERY

#### PHASE 1: Traditional Triage

Utilize **Autoruns** to baseline the system.

1. Launch `Autoruns64.exe` as SYSTEM.
2. Review the `Logon` and `Services` tabs.
3. **HINT:** Look for "Unsigned" or "File not found" entries that masquerade as legitimate Windows binaries.

#### PHASE 2: Hunting Shadow Keys

Standard `regedit.exe` can be fooled by null-terminated strings. Use **Registry Explorer** for forensic-grade analysis.

1. Open **Registry Explorer**.
2. Navigate to `HKCU\Software\Microsoft\Windows\CurrentVersion\Run`.
3. Identify any value names that appear "blank" or contain non-ASCII characters.
4. **RECOVERY:** Extract the command-line string associated with the shadow key.

#### PHASE 3: WMI Eventing

If the registry is clean, the adversary may be using WMI Event Consumers.

```powershell
# Query C2 for WMI Event Filters
Get-WmiObject -Namespace root\subscription -Class __EventFilter
```

---

### 4.0 TECHNICAL REPORTING

> **OPERATIONAL WARNING**
> Do not execute any binaries discovered during the hunt on the TARGET-WK01 workstation. Move all samples to the RED ZONE (MALWARE-01) for analysis.

Submit your findings using the **SITREP** format:

1. **Persistence Mechanism**: (Registry Path / WMI Filter Name)
2. **Payload Location**: (Full path to the malicious binary)
3. **Obfuscation Method**: (How was it hidden?)
4. **Recommended Countermeasure**: (How would you automate the detection of this across the enterprise?)

---

### 5.0 MISSION COMPLETION CRITERIA

1. Identification of the primary persistence mechanism.
2. Successful extraction of the malicious payload SHA256 hash.
3. Verification that the persistence was successfully analyzed in **Registry Explorer**.
