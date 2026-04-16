---
layout: ../layouts/MarkdownLayout.astro
title: Course Syllabus
---


### **DCO 550: Advanced Adversary Hunting & Malware Reverse Engineering (Full Syllabus)**

| **Course Code:** | DCO 550 |
| :--- | :--- |
| **Course Title:** | Advanced Adversary Hunting & Malware Reverse Engineering |
| **Prerequisites:** | **DCO 450: Cyber Defense Hunt Analyst** (Mandatory), Proficiency in Python |

---

#### **Course Description**

This course is the definitive capstone for the modern cyber defender, designed to elevate students from hunt analysts to elite adversary hunters. Assuming a mastery of foundational hunt principles, this curriculum plunges students into the proactive, adversarial mindset required to track and dissect sophisticated threats. The course is built on a dual-pronged approach: **(1)** Advanced, forensics-driven threat hunting to find hidden evil on enterprise networks, and **(2)** In-depth malware reverse engineering to understand the adversary's tools. Woven throughout is a strong emphasis on data science and automation, teaching students how to build data pipelines and apply statistical models to scale their hunting efforts. The course is intensely practical, aligning directly with the skillsets tested in the GIAC Certified Forensic Analyst (GCFA) and GIAC Reverse Engineering Malware (GREM) certifications.

---

#### **Learning Objectives**

Upon successful completion of this course, students will be able to:

*   **Hunt with Forensics:** Conduct advanced threat hunts using deep analysis of memory, file systems, and timeline artifacts to uncover adversary activity that evades traditional security tools.
*   **Reverse Engineer Malware:** Perform static and dynamic analysis of malicious executables and scripts, using disassemblers and debuggers to determine functionality, extract IOCs, and understand code logic.
*   **Engineer Data for Hunting:** Build and manage ETL (Extract, Transform, Load) pipelines in Python to collect, normalize, and enrich security data for large-scale analysis.
*   **Apply Quantitative Analysis:** Apply statistical models (z-scores, entropy) and introductory machine learning to security datasets to mathematically identify anomalies and score threats.
*   **Defeat Anti-Forensics:** Identify and counter adversary techniques used to hide their tracks, including timestomping, artifact wiping, and code obfuscation.
*   **Synthesize and Report:** Integrate findings from host forensics, network analysis, and malware reversing into a comprehensive threat intelligence report detailing adversary TTPs.

---

#### **Weekly Schedule**

| Week | Session | Topic | Assignments & Readings |
|:---|:---|:---|:---|
| **PART I: Advanced Endpoint Hunting & Static Analysis** |
| **1** | 1.1 | **Adversary Hunting & RE:** The Modern Hunter's Triad. Course overview. | **Read:** *PMA*, Ch. 1-2. |
| | 1.2 | **The Hunter's Toolkit:** Lab environment setup (Azure). Introduction to Ghidra, Volatility 3, and Plaso. | **Assignment:** Lab 1 (Due Wk 2): Validate Azure Lab Environment. |
| **2** | 2.1 | **Hunting for Persistence with Forensics:** Deep dive into hunting for advanced persistence in the Registry, WMI, and Scheduled Tasks. | **Read:** *AMF*, Ch. 14. |
| | 2.2 | **Malware Lab - Basic Static Analysis:** Using Pestudio and Ghidra to perform initial triage on a malware sample that establishes persistence. | **Assignment:** Lab 2 (Due Wk 3): Hunt & RE report on a persistence mechanism. |
| **3** | 3.1 | **Memory Forensics for Hunting:** Finding evidence of code injection, process hollowing, and reflective loading by analyzing memory images. | **Read:** *AMF*, Ch. 5-7. |
| | 3.2 | **Malware Lab - Dynamic Behavioral Analysis:** Using a sandbox environment to monitor the behavior of a process-injecting malware sample. | **Assignment:** Lab 3 (Due Wk 4): Report on injected code found in memory. |
| **4** | 4.1 | **Hunting with Filesystem Forensics:** Analyzing the USN Journal and $I30 attributes to find evidence of file deletion and timestomping. | **Read:** SANS Whitepaper on USN Journal Forensics. |
| | 4.2 | **Malware Lab - Code Analysis Fundamentals:** Using Ghidra to analyze the functions within a tool that performs timestomping. | **Assignment:** Lab 4 (Due Wk 5): Report proving timestomping. |
| **PART II: Data Science & Automation for the Hunter** |
| **5** | 5.1 | **Data Engineering for the Hunt (Module 8):** Building an ETL Pipeline in Python. Using Pandas to extract, normalize, and enrich security logs. | **Read:** *Python for Data Analysis*, Ch. 1-3. |
| | 5.2 | **Data Science Lab:** Write a Python script to parse and enrich logs from multiple sources into a clean DataFrame for analysis. | **Assignment:** Lab 5 (Due Wk 6): Submit a functional security ETL script. |
| **6** | 6.1 | **Applied Statistics for Hunt (Module 11):** Finding anomalies with math. Applying Z-Scores for outlier detection. | **Read:** "Data-Driven Security," Ch. 3. |
| | 6.2 | **Data Science Lab:** Write a Python script using Pandas and NumPy to apply statistical analysis to your enriched data to find anomalous activity. | **Assignment:** Lab 6 (Due Wk 7): Report on anomalies found using z-score calculations. |
| **7** | 7.1 | **Information Theory & ML (Module 11):** Using Entropy to find DGAs. Introduction to Unsupervised ML for clustering. | **Read:** "Hands-On Machine Learning," Ch. 9. |
| | 7.2 | **Data Science Lab:** Use Entropy calculations and Scikit-learn's Isolation Forest to find anomalous hosts. | **Assignment:** Lab 7 (Due Wk 8): Report on findings from Entropy and ML analysis. |
| **8** | 8.1 | **Midterm Review & Capstone Kickoff:** Review of concepts. **Capstone Project scenario is released.** | **Read:** Capstone Project documentation. |
| | 8.2 | **Midterm Examination:** A practical, multi-part exam requiring both forensic analysis (GCFA prep) and malware analysis (GREM prep). | **No new assignments.** |
| **PART III: Reversing, Lateral Movement, & Super Timelines** |
| **9** | 9.1 | **Hunting for Lateral Movement:** Tracing attacker movement via RDP, WMI, and remote service execution. | **Read:** The DFIR Report (latest entry on lateral movement). |
| | 9.2 | **Malware Lab - Analyzing Malicious Scripts:** Deobfuscating PowerShell and VBScript used for lateral movement. | **Assignment:** Lab 8 (Due Wk 10): Trace an attacker's path and reverse the script used. |
| **10**| 10.1| **Building the Super Timeline:** Using Plaso to combine all artifacts from multiple hosts into a single chronological narrative. | **Read:** SANS Whitepaper on Super Timelines. |
| | 10.2| **Hunt Lab - Timeline Analysis:** Pivoting through a massive super timeline to build the full story of an attack. | **Assignment:** Lab 9 (Due Wk 11): Submit a detailed attack narrative. |
| **11**| 11.1| **Hunting for C2 & Exfil:** Finding C2 beacons and data exfiltration channels through advanced network traffic analysis. | **Read:** *AMF*, Ch. 6. |
| | 11.2| **Malware Lab - Dynamic Code Analysis:** Using a debugger (x64dbg) to step through a backdoor's C2 communication loop. | **Assignment:** Lab 10 (Due Wk 12): Report on C2 protocol and exfiltrated data. |
| **12**| 12.1| **Defeating Obfuscation & Packers:** Understanding how attackers hide their code. Techniques for unpacking malware using a debugger. | **Read:** *PMA*, Ch. 16-17. |
| | 12.2| **Malware Lab - Unpacking Malware:** Use a debugger to find the Original Entry Point (OEP) of a packed executable and dump the payload. | **Assignment:** Lab 11 (Due Wk 13): Submit an unpacked malware sample and report. |
| **PART IV: Capstone Implementation & Presentation** |
| **13**| 13.1| **Capstone Workshop 1: The Hunt & RE:** Apply forensic hunting techniques to the capstone network and perform initial analysis of discovered malware. | **Work on Capstone Project.** |
| | 13.2| **Capstone Workshop 2: Data Science & Automation:** Build a data pipeline for capstone data and begin developing an automated detection script. | **Assignment:** Capstone Phase 1 Due. |
| **14**| 14.1| **Capstone Workshop 3: Deep Dive Reversing:** Perform deep-dive debugging and reverse engineering on the primary capstone malware payloads. | **Work on Capstone Project.** |
| **14**| 14.2| **Capstone Workshop 4: Finalizing the Automated Hunt:** Finalize the Python script for automated detection and integrate all findings. | **Assignment:** Capstone Phase 2 Due. |
| **15**| 15.1| **Capstone Final Work Session:** Final in-class session to address project issues and perform peer reviews. | **Work on Capstone Project.** |
| **15**| 15.2| **Course Review & Certification Pathing:** Review of concepts and how they map to the GCFA and GREM exams. | **No new assignments.** |
| **16**| 16.1| **Capstone Project Presentations:** Teams present their comprehensive findings, detailing adversary TTPs, reverse-engineered malware, and a live demo of their automated detection script. | **Assignment:** **Capstone Final Report & Code Due.** |
| **16**| 16.2| **Final Examination:** The final grade is based on the comprehensive capstone project. | **No new assignments.** |

---

#### **Grading Criteria**

| Component | Weight | Description |
|:---|:---|:---|
| Paired Lab Reports (11) | 40% | Reports covering both the hunt and malware analysis aspects of the weekly topic. Graded on forensic/RE accuracy and analytical depth. |
| Midterm Exam (Practical) | 20% | A hands-on exam with distinct GCFA-style forensic analysis and GREM-style malware analysis sections. |
| Capstone Project | 40% | Semester-long project graded on three components: the depth of the forensic hunt, the completeness of the malware reverse engineering, and the functionality of the final automated detection script. |
| **Total** | **100%** | |
