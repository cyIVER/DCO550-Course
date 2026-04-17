---
layout: ../../layouts/MarkdownLayout.astro
title: "Mission 03: Volatile Intel"
---

## MISSION 03: Volatile Intel (Memory Forensics)

### 1.0 MISSION OBJECTIVE

Analyze a physical memory capture from a suspected compromised host to identify advanced code injection and process hollowing techniques. You will utilize **Volatility 3** to pivot from process listings to memory-resident malware.

---

### 2.0 INTEL: SITUATION REPORT

A suspicious beacon was detected originating from **TARGET-WK01**. Initial triage found no persistent files on disk. Intelligence suggests the adversary is using **Reflective Loading** to execute their payload entirely in memory, leaving no traditional footprint on the filesystem.

**MITRE ATT&CK Mapping:**

* **T1055**: Process Injection
* **T1055.012**: Process Hollowing
* **T1620**: Reflective Code Loading

---

### 3.0 EXECUTION: MEMORY TRIAGE

#### PHASE 1: Process Enumeration

From **HUNTER-01**, begin analyzing the memory image `memdump.raw` located in the `C:\Analysis\Missions\03\` directory.

```bash
# List all active processes
vol.py -f memdump.raw windows.pslist
```

**CRITICAL TASK:** Look for parent-child relationship anomalies (e.g., `cmd.exe` spawning `svchost.exe`).

#### PHASE 2: Identifying Injected Code

Utilize the `malfind` plugin to search for memory regions that are both **Commit** and have **Execute/Read/Write (ERW)** permissions—a hallmark of code injection.

```bash
# Scan for suspicious memory regions
vol.py -f memdump.raw windows.malfind
```

#### PHASE 3: Detecting Process Hollowing

Compare the process list (`pslist`) with the process scan (`psscan`) and task list (`pstree`). Discrepancies often indicate hidden or unlinked processes.

---

### 4.0 ANALYTICAL DEEP DIVE

> **OPERATIONAL WARNING**
> When dumping memory regions for analysis, ensure you are in the RED ZONE. Injected code may contain anti-forensic triggers that attempt to clear logs or terminate analysis tools if they detect debugger attachments.

**Technical Task:**

Dump the suspicious memory region identified in Phase 2 for static analysis in **Ghidra**.

```bash
# Dump memory for specific PID
vol.py -f memdump.raw -o ./output windows.vaddump --pid <SUSPICIOUS_PID>
```

---

### 5.0 MISSION COMPLETION CRITERIA

1. Successful identification of the hollowed or injected process.
2. Recovery of the injected payload from memory to disk.
3. Mapping the memory-resident TTPs to the MITRE ATT&CK framework.
4. Identification of the C2 IP address embedded within the memory-resident payload.
