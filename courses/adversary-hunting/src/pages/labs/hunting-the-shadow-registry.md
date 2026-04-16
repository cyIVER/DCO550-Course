---
layout: ../../layouts/MarkdownLayout.astro
title: "Lab 02: Hunting the Shadow Registry"
---

### **Overview**
In this lab, you will perform deep-dive forensic analysis of the Windows Registry to identify advanced persistence mechanisms. You will analyze a compromised system where an adversary has established persistence using both traditional and "shadow" (obfuscated) registry keys.

---

### **Learning Objectives**
*   Identify common registry persistence locations (Run, RunOnce, Winlogon).
*   Discover stealthy persistence via WMI Event Consumers.
*   Analyze "Null-terminated" or "Hidden" registry keys.
*   Extract IOCs from registry values for further RE.

---

### **Environment Setup**
1.  **System:** Windows 10 "Victim" VM (provided in Azure Lab).
2.  **Tools:**
    *   **Registry Editor (regedit.exe)**
    *   **Eric Zimmerman's RECmd / Registry Explorer**
    *   **Sysinternals Autoruns**
    *   **Velociraptor (Local Collector)**

---

### **Phase 1: Baseline Analysis**
Before searching for evil, we must understand normal.
1.  Run `Autoruns64.exe` as Administrator.
2.  Review the "Everything" tab.
3.  Filter for "Microsoft" and "Windows" entries to hide legitimate system persistence.

### **Phase 2: Hunting the "Shadow" Keys**
The adversary has utilized a technique to hide a registry key by prepending it with a null character. Standard `regedit.exe` often fails to display these correctly or throws an error.

1.  Open **Registry Explorer**.
2.  Load the `SOFTWARE` hive from `C:\Windows\System32\config\`.
3.  Navigate to `Microsoft\Windows\CurrentVersion\Run`.
4.  Look for values with unusual names or non-printable characters.

### **Phase 3: WMI Persistence**
Adversaries often use WMI to trigger execution upon system events (e.g., 5 minutes after boot).

1.  Using PowerShell, query the WMI event filters:
    ```powershell
    Get-WmiObject -Namespace root\subscription -Class __EventFilter
    ```
2.  Analyze the `Query` property for suspicious triggers.

---

### **Deliverables**
Submit a technical report containing:
1.  A screenshot of the discovered persistence mechanism.
2.  The full path and value of the malicious registry key.
3.  The SHA256 hash of the executable pointed to by the persistence.
4.  A 1-paragraph summary of how this persistence would survive a reboot.
