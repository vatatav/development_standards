# Logging Procedures and Guidelines

## 1. Introduction

This document outlines the mandatory procedures for maintaining development logs across the entire workspace. The goal is to create a clear, consistent, and traceable history of both high-level strategic decisions and project-specific development activities.

The logging system is built on a **dual-level hierarchy**:
* **Global Logs:** A master set of logs that tracks the overarching history of all sessions and user progress across all projects.
* **Project-Specific Logs:** Each independent project maintains its own complete set of logs, detailing its unique development lifecycle.

Adherence to these standards is critical for enabling smooth handovers between LLM assistants and for maintaining a comprehensive record of the workspace's evolution.

## 2. Core Principles

* **Dual-Level Traceability:** Every action must be traceable from both a project-level and a global-level perspective. The global logs provide the "big picture" of the user's journey, while project logs provide the detailed technical history.
* **Linked History:** The standardized `ItemID` format is the key that links granular project work back to a specific global session. This ensures that the context for any given change is never lost.
* **Unambiguous Identification:** All log files, session entries, and log items must follow the strict naming and formatting conventions outlined in this document to ensure they are unique and easily identifiable.
* **Pristine History:** Log files must not be polluted with extraneous information. They are a formal record of development, not a scratchpad.

## 3. Log File and Directory Structure

The logging system operates on a two-level hierarchy to ensure both a high-level overview and granular project detail.

### 3.1. Global Log Directory

A master log directory exists at the top level of the workspace, structured as:
* `./00_universe_meta/logs/`

This directory contains the global `sessions.md` file, which tracks every session across all projects, as well as the master `llm_assisted_development_log.md` and `user_progress_log.md` containing the complete, unabridged history.

### 3.2. Project-Specific Log Directory

Each independent project contains its own `logs/` directory at its root.
* Example path from within a project: `./logs/`

This directory holds all logs and process documents pertinent **only** to that project:
* `llm_assisted_development_log.md`
* `user_progress_log.md`
* `sessions.md`
* All `HO_*.md` (HandOver) and `TO_*.md` (TakeOver) files.

## 4. `sessions.md` Management

The `sessions.md` file is a high-level summary of work sessions. A distinction is made between the global session log and project-specific session logs.

### 4.1. Global `sessions.md` File

Located in the global log directory (`./00_universe_meta/logs/`), this file provides a sequential, chronological record of all work sessions.
* **Entry Format:** Each entry is sequentially numbered and uses the global session ID.
    ```
    <SeqNo>. S[GlobalNo]-ADL-[StartDate]
    Date Interval: [Start Time] - [End Time]
    Reason: [A high-level summary of the session's purpose and outcome.]
    Date added to log: [Date of entry]
    Mode: [LLM Mode]
    LLM Model: [LLM Model Name]
    Source: "[Conversation Context] ([SourceLogFileName].md)"
    Total Items in Session: [Total item count from the global log]
    ```
* **Special Case:** In a session where multiple new projects are created, the global log will contain one main entry for the overall session, followed by separate, subsequent entries marking the "birth" of each project.

### 4.2. Project-Specific `sessions.md` File

Located in each project's `./logs/` directory, this file tracks only the conversations relevant to that project.
* **Entry Format:** Each entry is sequentially numbered and uses the full `S...-C...` identifier.
    ```
    <ProjSeqNo>. S[GlobalNo]-[PRJ]-[C-ConvNo]-[Date]
    Date Interval: [Start Time] - [End Time]
    Reason: [A summary of the session's purpose specific to this project.]
    Date added to log: [Date of entry]
    Mode: [LLM Mode]
    LLM Model: [LLM Model Name]
    Source: "[Conversation Context] ([SourceLogFileName].md)"
    Total Items in Session: [Total item count from this project's log]
    ```

## 5. Log Entry and ItemID Format

Each entry in a project-specific `llm_assisted_development_log.md` or `user_progress_log.md` must adhere to the following strict format.

### 5.1. Log Entry Header

Every new entry must begin with a separator and a two-line header that provides global and project-specific context.

**Format:**
Total Session No: S[GlobalNo]
[PRJ]-[C-ConvNo] Session Start: [YYYY.MM.DD HH:MM]
* `[GlobalNo]`: The 5-digit global session number (e.g., `S0015`).
* `[PRJ]`: The project abbreviation (e.g., `MAF`).
* `[C-ConvNo]`: The 2-digit project-specific conversation number (e.g., `C01`).

### 5.2. ItemID Naming Convention

Every log entry must have a unique `ItemID`. This ID is the key to tracing work across the workspace.

**Format:** `[PRJ]-[C-ConvNo]-[LogType]-[Date]-[SeqNo]-[S-GlobalNo]`

**Breakdown:**
* `[PRJ]`: Project abbreviation (e.g., `MAF`, `DS`).
* `[C-ConvNo]`: Project-specific conversation number (e.g., `C01`).
* `[LogType]`: `ADL` for the development log, `UPL` for the user progress log.
* `[Date]`: The date of the entry in YYYYMMDD format.
* `[SeqNo]`: A 3-digit sequential number for the item within that day's log (e.g., `001`).
* `[S-GlobalNo]`: The 5-digit global session number (e.g., `S0015`), repeated at the end for easy cross-referencing.

**Example:** `MAF-C01-ADL-20250623-001-S0015`

## 6. Handover, Takeover, and Session Finalization

The end of a conversation or session is a formal process that must be logged correctly.

* **Handover:** The handover process concludes with the creation of the `HO_[PRJ]...md` file, which must be saved in the project's `./logs/` directory. The LLM must also add a final `Project Handover Finalization` entry to the project's logs.
* **Takeover:** The takeover process begins with the creation of the `TO_[PRJ]...md` file in the project's `./logs/` directory and the creation of the first log entries for the new conversation.
* **Session End:** The final action in any log file for a given conversation is the `Session End` marker, which must include the total count of `ItemID`s created during that conversation.

## 7. Complete Log Entry Example

The following is a complete and correct example of a single entry in a project-specific `llm_assisted_development_log.md`.

```markdown
********************************************************************************
**Total Session No: S0015**
**MAF-C01 Session Start:** 2025.06.23 18:00
**Mode:** Gemini Web Interface
**LLM Model:** Gemini 2.5 Pro (preview)
**Source:** S0015-MAF-C01-20250623_Gemini-Web-Interface_Gemini-2.5-Pro-preview.md

**ItemID:** MAF-C01-ADL-20250623-001-S0015
**Date:** 2025.06.23
**Phase:** Feature Development
**LLM Interactions - Actions:**
* User requested the implementation of a new feature.
* LLM analyzed the request and proposed a multi-step plan.
* User approved the plan.
**User Insights Recorded:** User confirmed the plan aligns with the project's long-term goals.
**Related User Progress Log Entry:** MAF-C01-UPL-20250623-001-S0015
---