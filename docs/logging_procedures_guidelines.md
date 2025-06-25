# Logging Procedures and Guidelines

## 1. Introduction

This document outlines the mandatory procedures for maintaining development logs across the entire workspace. The goal is to create a clear, consistent, and traceable history of both high-level strategic decisions and project-specific development activities.

The logging system is built on a **dual-level hierarchy**:
* **Global Logs:** A master set of logs that tracks the overarching history of all sessions and user progress across all projects.
* **Project-Specific Logs:** Each independent project maintains its own complete set of logs, detailing its unique development lifecycle.

Adherence to these standards is critical for enabling smooth handovers between LLM assistants and for maintaining a comprehensive record of the workspace's evolution.

## 2. Core Principles

* **Dual-Level Traceability:** Every action must be traceable from both a project-level and a global-level perspective. The global logs provide the "big picture" of the user's journey, while project logs provide the detailed technical history.
* **Linked History:** The standardized `ItemID` format is the key that creates traceability. It primarily links a user's learning (`UPL` entry) to the specific technical work (`ADL` entry) that prompted it. It also links all project-specific work back to a specific global session (`S-GlobalNo`), ensuring the full context is never lost.
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

The `sessions.md` file provides a high-level summary of work sessions. Both global and project-specific logs follow the same core entry format for consistency.

### 4.1. Entry Format

* **Identifier:** Each entry is sequentially numbered and uses the full, descriptive identifier:
    * `<SeqNo>. S[GlobalNo]-[PRJ]-[C-ConvNo]-[Date]`
    * For entries in the global log that are not tied to a specific project (e.g., a master refactoring session), `[META]` can be used as the `[PRJ]` abbreviation.
    * The [Date] component refers to the start date of the project-specific conversation in YYYYMMDD format.

* **Body:**
    ```
    Date Interval: [Start Time] - [End Time]
    Reason: [A high-level summary of the session's purpose and outcome.]
    Date added to log: [Date of entry]
    Mode: [LLM Mode]
    LLM Model: [LLM Model Name]
    Source: "[Conversation Context] ([SourceLogFileName].md)"
    Session Highlights:
    * [First key achievement or outcome]
    * [Second key achievement or outcome]
    * [...]
    Total Items in Session: [The total count of ItemIDs from that session's llm_assisted_development_log.md]
    ```

### 4.2. File Locations

* The **Global `sessions.md`** is located in `./00_universe_meta/logs/` and contains a chronological record of all sessions across all projects.
* A **Project-Specific `sessions.md`** is located in each project's `./logs/` directory and contains only the entries relevant to that project.

## 5. Log Entry Structure and Fields

### 5.1. Session Header Fields

Every log file for a new project-specific conversation must begin with a header block that contains the following metadata. This header is written once at the start of the conversation and is not repeated.

* `Total Session No`: The 5-digit global session number for the entire workspace (e.g., `S0016`). This links the project work back to the master timeline.

* `[PRJ]-[C-ConvNo] Session Start`: The unique identifier and the precise start date and time for the current project-specific conversation. `[PRJ]` is the project abbreviation, and `[C-ConvNo]` is the 2-digit sequential conversation number for that project.

* `Commit Counter`: Used to track the sequence of commits within this specific conversation. It should be initialized to `0` at the start of the conversation and incremented by the LLM before generating each new commit message.

* `Mode`: The interface used for the LLM interaction (e.g., "Gemini Web Interface", "ChatGPT Interface").

* `LLM Model`: The specific name of the LLM model being used (e.g., "Gemini 2.5 Pro (preview)", "ChatGPT 4o").

* `Source`: This field can have two meanings:
    1.  `Ongoing Conversation`: Used when the log entries are being created by the LLM during the live session.
    2.  `[Filename].md`: Used when a different LLM is creating the log entries by analyzing the transcript of a previous conversation. In this case, it is the filename of the transcript.

### 5.2. Log Item Fields

Each log entry is composed of a set of key-value fields. The following defines the purpose and expected content for each field.

#### `llm_assisted_development_log.md` (ADL) Specifics

This is the **Project's Diary**. Its fields are:

* **`ItemID`**: The unique identifier for the log entry. Its format is strictly defined in Section 5.3.
* **`Date Interval`**: The start and end date/time showing the span of work for the logged activity (e.g., `2025.06.25 09:15 - 10:45`).
* **`Activity`**: A short, descriptive title for the work being logged (e.g., "Feature Development (Goal A)", "Documentation Update").
* **`LLM Interactions - Actions`**: A bulleted list of the objective, factual actions performed. It should focus on the **"what"** and **"how"** of the task (e.g., "Refactored the `user` class," "Added a new endpoint").
* **`User Insights Recorded`**: A summary of the key decisions or strategic insights from the user that provided the necessary **"why"** for the actions.
* **`Related User Progress Log Entry`**: The full `ItemID` of the corresponding entry in the `user_progress_log.md` file, if one exists.

#### `user_progress_log.md` (UPL) Specifics

This is the **User's Diary**. UPL entries should only be created when a genuine learning moment occurs.

* **`ItemID`**: The unique identifier, matching the ADL format.
* **`Date`**: The single date (`YYYY.MM.DD`) when the insight or learning occurred.
* **`Topic`**: A high-level title for the user's learning or insight (e.g., "Redefining the Core Philosophy of Logging").
* **`Insights & Learnings`**: A first-person summary of the user's "Aha!" moment or new understanding. This is the core of the UPL entry.
* **`Challenges & Solutions` (Optional)**: A field to document a specific problem and the thinking process that led to a solution.
* **`Related Development Log Entry`**: The full `ItemID` of the corresponding entry in the `llm_assisted_development_log.md` file.

### 5.3. ItemID Naming Convention

Every log entry must have a unique `ItemID`. This ID is the key to tracing work across the workspace.

**Format:** `[PRJ]-[C-ConvNo]-[LogType]-[Date]-[SeqNo]-[S-GlobalNo]`

**Breakdown:**
* `[PRJ]`: Project abbreviation (e.g., `MAF`, `DS`).
* `[C-ConvNo]`: Project-specific conversation number (e.g., `C01`).
* `[LogType]`: `ADL` for the development log, `UPL` for the user progress log.
* `[Date]`: The start date of the project-specific conversation in `YYYYMMDD` format. This date remains constant for all items within the same conversation.
* `[SeqNo]`: A 3-digit sequential number for the item within the entire project-specific conversation (e.g., `001`, `002`, ...). It does not reset each day.
* `[S-GlobalNo]`: The 5-digit global session number (e.g., `S0015`), repeated at the end for easy cross-referencing.

**Example:** `MAF-C01-ADL-20250623-001-S0015`

### 5.4. Complete Log Entry Example

The following is a complete and correct example of a single entry in a project-specific `llm_assisted_development_log.md`.

```markdown
********************************************************************************
**Total Session No: S0015**
**MAF-C01 Session Start:** 2025.06.23 18:00
**Mode:** Gemini Web Interface
**LLM Model:** Gemini 2.5 Pro (preview)
**Source:** Ongoing Conversation

**ItemID:** MAF-C01-ADL-20250623-001-S0015
**Date Interval:** 2025.06.23 18:00 - 18:30
**Activity:** Feature Development
**LLM Interactions - Actions:**
* User requested the implementation of a new feature.
* LLM analyzed the request and proposed a multi-step plan.
* User approved the plan.
**User Insights Recorded:** User confirmed the plan aligns with the project's long-term goals.
**Related User Progress Log Entry:** MAF-C01-UPL-20250623-001-S0015
---
## 6. Handover, Takeover, and Session Finalization

The end of a conversation or session is a formal process that must be logged correctly and executed by following the established procedures.

* **Handover:** The handover process **must be conducted according to the steps outlined in `llm_handover_procedures.md`**. This process concludes with the creation of the `HO_[PRJ]...md` file and a final `Project Handover Finalization` entry in the project's logs.
* **Takeover:** The takeover process **must be conducted according to the steps outlined in `llm_takeover_procedures.md`**. This process begins with the creation of the `TO_[PRJ]...md` file and the first log entries for the new conversation.
* **Session End:** The final action in any log file for a given conversation is the `Session End` marker. It must include:
    * The session end date and time in the format: `**[PRJ]-[C-ConvNo] Session End:** YYYY.MM.DD HH:MM`
    * The total count of `ItemID`s created during that conversation.
    * A **`Session Highlights`** section with a bulleted list summarizing the key achievements and outcomes of the session.