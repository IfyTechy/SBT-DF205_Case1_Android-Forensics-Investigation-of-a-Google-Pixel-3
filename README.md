# Android File System Forensics - Google Pixel 3

## Overview
This investigation was conducted as part of **SBT-DF205 Case Study 1: Android Forensics**.  
Objective: Examine a file-system extraction from a Google Pixel 3 running Android 10, identify relevant digital artifacts, preserve evidence integrity, and correlate findings to reconstruct events supported by the available data.

Workflow applied:
- Evidence preservation
- Android artifact examination
- SQLite database analysis
- Cross-artifact correlation
- Forensic documentation

---

## Objectives
- Preserve original evidence and verify integrity using SHA-256 hashing
- Identify Android version, build fingerprint, and user profiles
- Examine system settings, Wi-Fi, and Bluetooth artifacts
- Analyze SMS, MMS, contacts, call logs, and calendar databases
- Investigate Google Messages and Google Dialer artifacts
- Examine third-party messaging apps and location-related artifacts
- Correlate timestamps and records to construct a forensic timeline
- Document findings, evidence handling procedures, and limitations

---

## Tools and Technologies
- **Kali Linux**: Digital forensics environment  
- **VMware**: Virtualized examination environment  
- **SQLite3**: Read-only examination of SQLite databases  
- **SQL**: Database queries, record counts, joins, correlation  
- **SHA-256**: Evidence integrity verification  
- **Linux utilities**: Archive verification, file management, artifact discovery  

---

## Investigation Process

### 1. Evidence Preservation and Integrity Verification
- Structured case directory created (archive, extracted evidence, working copy, outputs, logs).
- SHA-256 hash calculated and verified.

Original evidence SHA-256:
Withheld from the public portfolio; retained in the private case records.

- Archive integrity test passed.
- Working copy compared with original, no differences found.

---

### 2. Device Identification and User Profiles
Findings:
- Android version: **10**
- SDK version: **29**
- Build fingerprint:  
  `google/blueline/blueline:10/QQ1A.200105.003/6079943:user/release-keys`
- Bluetooth name: **Pixel 3**
- User-profile IDs: **0** and **11**

Note: Multiple profiles ≠ proof of multiple users.

---

### 3. System Settings and Connectivity
- Wi-Fi enabled  
- Bluetooth disabled  
- Airplane mode off  
- ADB enabled  
- Stored Wi-Fi configuration artifact present  
- Bluetooth device entry: **Rouge**

Observation: Configuration evidence does not prove active connections or transfers.

---

### 4. SMS, MMS, Contacts, Calls, and Calendar
- Incoming SMS: verification codes, notifications  
- Outgoing SMS: conversational messages  
- MMS records with text content  
- Contact records correlated with phone numbers  
- Call-log entries (including deleted records)  
- Google calendar account configured, but no events found  

Note: Deletion markers ≠ guaranteed recoverability.

---

### 5. Google Messages and Google Dialer
Database examined:  
`data/data/com.google.android.apps.messaging/databases/bugle_db`

Tables inspected: messages, conversations, participants, parts, message_status, read_reports.

Findings:
- SMS/MMS records correlated with telephony database
- Google Dialer annotated call logs matched Android call logs
- Message content, status codes, and read-report metadata treated as distinct evidence

---

## Evidence Handling and Analysis
- Preserved original archive, analyzed working copy
- Verified integrity with SHA-256
- Used read-only SQLite queries
- Identified associated `-wal` and `-shm` files
- Recorded file paths, tables, record IDs, timestamps
- Correlated artifacts across sources
- Distinguished direct observations from interpretations
- Documented limitations, avoided unsupported conclusions

---

## Repository Structure
## Repository Structure

```text
repository-root/
├── README.md
└── 03_outputs/
    ├── Evidence_Register.csv
    ├── Handling_Log.csv
    ├── Queries.sql
    ├── Screenshot_Checklist.csv
    └── Timeline.csv
```
---

## Key Skills Demonstrated
- Android file-system forensics
- Evidence preservation and integrity verification
- Linux command-line operations
- SQLite database analysis and SQL querying
- SMS, MMS, contacts, call-log, calendar artifact examination
- Cross-artifact correlation and timestamp analysis
- Forensic documentation and reporting
- Evidence interpretation within limitations

---

## Investigation Status
**Status: In progress**

Completed:
- Evidence verification and extraction
- Device identity, user profiles, connectivity settings
- Communication databases, contacts, call logs, calendar records
- Google Messages and Google Dialer

Remaining:
- Additional messaging and location artifacts
- Forensic timeline completion
- Consolidation of evidence register and handling log
- Final forensic report preparation
- Submission package validation

---

## Disclaimer
This project is for **educational and authorized training purposes**.  
Findings are limited to examined artifacts.  
Presence of a record ≠ proof of action, intent, or success.  

Sensitive data (device extraction, private communications, authentication codes, cryptographic material) will not be published. Screenshots and outputs will be redacted.

---

## Author
Building practical skills in **digital forensics and cybersecurity** through structured investigations, Linux-based analysis, database examination, and evidence-based reporting.
