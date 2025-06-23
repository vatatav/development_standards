# LLM Handover Procedures (For Outgoing LLM)

This document outlines the procedures to be followed by an LLM assistant when the user issues a command to hand over the project (e.g., "Projeyi devret"). The goal is to ensure all necessary information is packaged for a smooth transition to a new LLM, with user approval at a critical checkpoint.

## 1. Prerequisites for LLM

*   You must have access to read and write files within the `python_workspace/`.
*   You should be aware of your own LLM Identifier (Mode and Model) and your original takeover date for this project (e.g., from your `TakeOver_...md` file or initial logs).
*   You must be able to request the current date and time from the user for logging purposes.
*   **Crucially, ensure you are familiar with THIS document (`llm_handover_procedures.md`) in its most current state before proceeding.**

## 2. Procedure Upon Receiving "Projeyi devret" Command

### Step 1: Acknowledge, Request Current Information

1.  Acknowledge the user's request to hand over the project.
2.  Request the current date and time from the user (for logging and potential file naming).
3.  Confirm your LLM Identifier (Mode, Model) and your original takeover date for this project with the user.

### Step 2: Prepare Draft Handover Report and Git Activity Summary

Compile a comprehensive **Draft Handover Report**. This report should include:

1.  **Overall Project Goal(s):** What is the project trying to achieve?
2.  **Current Workspace/Project Root Path:** (e.g., `d:\\AI_projects\\roo_code_LLM_universe\\python_workspace\\`)
3.  **Detailed Current Status of Files and Directories:**
    *   List key directories created/modified within `python_workspace`.
    *   List key files created/modified (especially in `documentation/`, `shared_libs/`, and the current project like `projects/financial_tracker/`), noting if they are empty, partially populated, or considered complete.
    *   Mention any significant files or features that are planned but not yet started.
4.  **Summary of Key Decisions Made and Important Actions Taken During Your Tenure:** (e.g., choices about Python versions, library installations, tooling setup, core architectural decisions discussed).
5.  **Git Activity Summary (as per `llm_takeover_procedures.md` guidelines):**
    *   Key commits (messages, branches involved).
        *   Ensure all commits made *during the current LLM's entire tenure* are listed, including any preliminary commits for setup, corrections, or documentation updates made at the start or throughout the session.
    *   Creation of new branches and their purpose.
    *   Merges performed.
    *   Any significant rebasing or rollback operations (if applicable and noteworthy, along with reasons).
6.  **The Very Next Immediate Planned Step(s) You Were About to Undertake or Propose:** What was the immediate next piece of work?
7.  **Pointers to Crucial Documentation/Standard Files:** Remind the user/next LLM about:
    *   `documentation/standards.md`
    *   `documentation/llm_takeover_procedures.md` (for the incoming LLM)
    *   `documentation/project_lifecycle_guidelines.md`
    *   `documentation/logging_procedures_guidelines.md`
    *   `history/progress/user_profile_for_llm_assistance.md`
    *   The main project `README.md` and any project-specific `README.md` files.
8.  **Your Role During Tenure:** Briefly describe the role you fulfilled.
9.  **Specific Instructions/Context for the New LLM (Optional but helpful):** Any nuances, unresolved discussions, or specific areas the new LLM should pay attention to.
10. **Review and Suggest User Profile Updates (Optional):**
    *   Reflect on your interactions with the user during your tenure.
    *   If you have observed any new, significant, or changed user preferences, working styles, or communication nuances that are not yet captured (or not accurately captured) in `history/progress/user_profile_for_llm_assistance.md`, consider proposing additions or modifications.
    *   Any proposed changes should be clearly formulated. If you suggest adding them directly to the user profile, they should be marked with the current session's date (YYYYMMDD) in parentheses, similar to existing entries.
    *   These suggestions can be presented to the user along with the Draft Handover Report for their consideration and approval before you (or the user) would modify the profile.

### Step 3: Present Draft Report to User for Approval & Check for Outstanding User Actions

1.  Present the complete Draft Handover Report (including the Git Activity Summary) to the user.
2.  Clearly state that this is the proposed content for the official `HandOver` file.
3.  **Outstanding User Actions Check:** Review if there are any pending actions the user was expected to perform during your tenure (e.g., file deletions, specific Git commands that you cannot execute) that have not been confirmed as completed. If so, gently remind the user and request confirmation or completion before asking for final handover approval.
4.  Explicitly ask for the user's approval to proceed with creating the `HandOver` file and finalizing the handover, once any outstanding user actions are resolved.

### Step 5: Perform Final Standards Compliance Check

* Before finalizing the handover, review all changes made during your tenure (e.g., new files created, code added to shared libraries) against the rules outlined in `documentation/standards.md`.
* **If all changes are compliant:** Add a confirmation note to your final entry in `llm_assisted_development_log.md`, such as: *"Final compliance check passed. All new contributions align with `standards.md`."*
* **If you identify any non-compliant changes:** You must not proceed with the handover blindly. Instead, you must:
    1.  Report the specific deviation to the user.
    2.  Ask the user how to proceed by offering two options:
        * **Option A:** "Should we address and fix this compliance issue now, before I complete the handover?"
        * **Option B:** "Should I document this non-compliance in the `HandOver` file as a priority task for the next LLM to address?"
    3.  Proceed based on the user's decision.

...
### Step 6: Handle User's Decision

#### A. If User APPROVES Handover:

1.  **Update `history/progress/sessions.md`:** Append the approved session summary to this file.
2.  **Create Official `HandOver` File:**
    *   Create the `HandOver` file in the `python_workspace/history/handovers/` directory.
    *   **File Name Format:** `HandOver_[HandoverPrepDateYYYYMMDD]_[YourMode]_[YourLLMModel]_[YourTakeoverDateYYYYMMDD].md`
        *   `[HandoverPrepDateYYYYMMDD]`: The current date (when the handover is being prepared).
        *   `[YourMode]`: Your LLM's mode.
        *   `[YourLLMModel]`: Your LLM's model name.
        *   `[YourTakeoverDateYYYYMMDD]`: The date you (the outgoing LLM) originally took over the project.
    *   **Content:** The approved Draft Handover Report, including the detailed Git Activity Summary.
3.  **Update Log Files (`llm_assisted_development_log.md` and `user_progress_log.md`):**
    *   Append a final session-closing entry to both log files.
    *   In `llm_assisted_development_log.md`:
        *   **Phase:** `Project Handover Finalization`
        *   **LLM Interactions - Actions:** Detail the steps taken: User approved handover, `HandOver` file created (specify name), final Git commit made by user.
        *   **Session Highlights:** Include key achievements of the session and explicitly mention the Git Activity Summary (or include it directly).
    *   In `user_progress_log.md`:
        *   **Topic:** `Project Handover to New LLM Completed`
        *   **Insights & Learnings:** User reflections on the handover process.
    *   Ensure the `Session End` markers are correctly placed with final item counts.
    *   Verify that both `llm_assisted_development_log.md` and `user_progress_log.md` have been updated accurately with all required details, including session highlights, Git activity summary, and user reflections.
4.  **Prepare `sessions.md` Entry Text:**
    Based on information already recorded in your `llm_assisted_development_log.md` for the current session, prepare the text block for the new entry in `history/progress/sessions.md`. This text will be presented to the user for approval along with the Draft Handover Report.
    1.  **Locate Session Data in `llm_assisted_development_log.md`:**
        *   Identify the start and end markers for your current session. For example:
            *   `**ADL-YYYYMMDD Session Start:** YYYY.MM.DD HH:MM`
            *   `**ADL-YYYYMMDD Session End:** YYYY.MM.DD HH:MM` (This would be the current time of handover preparation).
    2.  **Extract and Format Information:**
        *   **Session Identifier Prefix (ADL-Date):** From the `Session Start` marker (e.g., `ADL-20250609`).
        *   **Sequential Number:** Determine the next sequential number for the `sessions.md` entry (e.g., if the last entry was "7.", this new entry will start with "8."). You may need to ask the user to confirm the last used sequence number if you cannot reliably determine it.
        *   **Full Identifier:** Combine the sequential number and the ADL-Date (e.g., "8. ADL-20250609").
        *   **Date Interval:** Use the date from `Session Start` and the current date/time (as `Session End`) (e.g., "2025.06.07 15:08 - 2025.06.09 19:58").
        *   **Reason:** Extract directly from the `**Reason:**` field in your `llm_assisted_development_log.md`.
        *   **Mode:** Extract directly from the `**Mode:**` field in your `llm_assisted_development_log.md`.
        *   **LLM Model:** Extract directly from the `**LLM Model:**` field in your `llm_assisted_development_log.md`.
        *   **Source (for `sessions.md`):**
            *   Start with the `**Source:**` text from your `llm_assisted_development_log.md` for the current session (e.g., "Ongoing Conversation").
            *   Generate your session-specific log filename. This typically follows the pattern: `S<SequentialSessionNumber>_<StartDateYYYYMMDD>_<YourMode>_<YourLLMModel>.md`. Ensure Mode and Model names are filename-friendly (refer to existing examples in `sessions.md` for formatting conventions like handling spaces or special characters).
            *   Combine these: `"<Extracted Source from log> (<Generated SessionLogFileName>.md)"`. For example: `"Ongoing Conversation (S08_20250609_CodeLLM - Agent_Gemini 2.5 Pro.md)"`.
        *   **Total Items in Session:** Extract directly from the `**Total Items in Session:**` field in your `llm_assisted_development_log.md`.
        *   **Date added to log (for `sessions.md`):** This will be the current date of handover preparation (e.g., "2025.06.09").
    3.  **Assemble the Text Block for `sessions.md`:**
        Construct the complete text block in the following format:
        ```
        <SequentialNumber>. ADL-<YYYYMMDD>
        Date Interval: <YYYY.MM.DD HH:MM> - <YYYY.MM.DD HH:MM>
        Reason: <Extracted Reason>
        Date added to log: <YYYY.MM.DD of handover prep>
        Mode: <Extracted Mode>
        LLM Model: <Extracted LLM Model>
        Source: <Constructed Source String with Session Log Filename>
        Total Items in Session: <Extracted Total Items>
        ```
5.  **Prompt User for Final Git Actions:** 
    * Remind the user that all documentation, code is now prepared and that they should perform the final `git add .`, `git commit`, and `git push` commands to save the state of the project and make it available to the next LLM.
    * **Propose a structured Git Commit Message.** The LLM must propose a well-structured commit message to the user for approval. This message must follow the Conventional Commits specification and include a session tag.
        * **Structure:** The commit message should be formatted as follows:
            ```
            type(scope): subject (YYYYMMDD)

            - A bullet point summarizing the first key change.
            - A bullet point summarizing the second key change.
            - Additional bullet points as needed.
            ```
        * **Components:**
            * `type`: Describes the kind of change (e.g., `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`).
            * `scope`: The part of the project affected (e.g., `procedures`, `financial_tracker`, `logging`).
            * `subject`: A concise, imperative-mood summary of the changes.
            * `(YYYYMMDD)`: The 8-digit date of the session being finalized.
            * **Body:** A detailed, bulleted list explaining the most important changes made during the session.
        * **Example:**
            ```
            docs(procedures): Enhance handover and logging rules (20250610)

            - Adds guidelines to handover procedure for creating structured Git commits.
            - Updates takeover procedure to require immediate creation of the session's first log entry.
            ```
    * Inform them that you will await their output from these commands for the final step.
6.  **Append Final Commit Details (Conditional Task):**
    * This task is triggered only when the user provides the output of the `git push` command.
    * Upon receiving the output, append it to the `HandOver_...md` file under a new heading like `## 11. Finalizing Commit Details`.
    * After successfully appending the text, inform the user that the handover process is now fully and formally complete, and the project is now formally ready for the next LLM.

#### B. If User DOES NOT Approve Handover (e.g., requests more work, postpones):

1.  **Acknowledge User's Decision:** Confirm understanding of the user's request to postpone or add tasks.
2.  **Log Postponement:**
    *   Append an entry to `llm_assisted_development_log.md` and `user_progress_log.md`.
    *   In `llm_assisted_development_log.md`:
        *   **Phase:** `Project Handover Postponement`
        *   **LLM Interactions - Actions:** "User reviewed the draft handover report and decided to postpone the handover. Reason: [User's reason, if provided]. Project development will continue with the following tasks: [List new/continuing tasks specified by the user]."
    *   In `user_progress_log.md`:
        *   **Topic:** `Project Handover Postponed by User`
        *   **Insights & Learnings:** User's rationale for postponement and any learnings from the pre-handover review.
3.  **Do NOT Create `HandOver` File:** The official `HandOver` file is not created at this time.
4.  **Continue Project Work:** Resume assisting the user with the ongoing or newly assigned tasks. The handover process can be re-initiated by the user at a later time (starting again from Step 1 of these procedures).
