# LLM Takeover Procedures (For Incoming LLM)

**Welcome!**

This document will guide you in taking over the current software development project. Our aim is to make this transition as smooth and efficient as possible.

## 1. Initial User Prompt

You will be initiated with a prompt from the user that contains session-specific information (Session Start Date, Mode, LLM Model, and the path to the previous LLM's handover file) and points you to this document. You must use that session-specific information for context.

## 2. Onboarding Procedure

Upon receiving the initial prompt from the user, you must perform the following steps in order:

1.  **Acknowledge and Read Key Documents:**
    * Acknowledge the user's request.
    * Read and process this document (`llm_takeover_procedures.md`) in its entirety.
    * Read and process all other core project documentation as listed in the "Required Reading" section below.

2.  **Verify Previous Session Finalization:**
    * Locate the `HandOver...md` file from the previous LLM (its name will be in your initial prompt).
    * Check if this file contains a final section with the `git push` output (e.g., "Finalizing Commit Details").
    * **If this section is missing, you must halt the takeover process.** Inform the user that the previous session does not appear to have been correctly finalized and pushed to the remote repository. Request that the user resolve this before you can safely proceed.

3.  **Verify Takeover Parameters:**
    * Before proceeding, perform a sanity check on the session-specific information you received in the initial prompt from the user.
    * Does the `Session Start Date` appear logical in sequence with the date of the file mentioned in `Previous LLM's Handover File Name`?
    * Is the `Mode` or `LLM Model Used` a name that has appeared before in the project logs, or does it appear to be new?
    * If you detect any potential inconsistencies (e.g., a date that seems out of order, a new model name that could be a typo), you **must** ask the user for clarification before proceeding. For example: *"I have noted the `LLM Model Used` is 'NewModel-X'. Is this a new model identifier we are now tracking, or could it be a typo?"*

4.  **Summarize Your Understanding:**
    * After reviewing all required documents, prepare a summary of your understanding of the project's current status, completed work, ongoing tasks, and overall objectives.
    * Present this summary to the user.

5.  **Propose a Continuation Plan:**
    * Based on your analysis, outline how you plan to proceed and what your initial steps will be.
    * Present this plan to the user for discussion and approval.

6.  **Create "TakeOver" File and Log Entries:**
    * Once the user approves your summary and plan, you will create a `TakeOver` file to formally confirm the handover, following the naming convention: `TakeOver_[TakeoverDateYYYYMMDD]_[YourMode]_[YourLLMModel].md`.
    * This file should be saved in the `history/takeovers/` folder. Its content should be the summary and plan we agreed upon.
    * At the same time, you must make the initial log entries in `llm_assisted_development_log.md` and `user_progress_log.md` for the takeover session, as specified in `logging_procedures_guidelines.md`.
    * Ensure that both the `TakeOver` file and the initial log entries are accurate, complete, and adhere to the project's documentation and logging standards.
## 3. Required Reading to Understand the Project

To fully understand the project, you must review the following resources:

1.  **Core Project Documentation:** All files within the `documentation/` folder. Pay special attention to:
    * `standards.md`
    * `project_lifecycle_guidelines.md`
    * `logging_procedures_guidelines.md`
    * `llm_handover_procedures.md`
    * `history/progress/user_profile_for_llm_assistance.md`
2.  **Project and User Development History:** All files within the `history/progress/` folder.
3.  **Previous LLM's Handover Report:** The handover file located in the `history/handovers/` folder, as specified by the user in the initial prompt.

## 4. Your Workflow and Future Handover Responsibilities

* **Adherence to Standards:** You are expected to strictly adhere to all standards and procedures defined in the documentation.
* **Diligent Logging:** Regularly and accurately log all significant progress as per the `logging_procedures_guidelines.md`.
* **Preparing for Future Handover:** Should the user request you to hand over the project ("Projeyi devret"), you **must** follow the procedures outlined in `documentation/llm_handover_procedures.md`. Your first action upon receiving that command must be to re-read that file to ensure you are following the most current protocol.
