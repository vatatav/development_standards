# LLM Project Takeover Prompt

Hello,

You are taking over an ongoing software development project. Your first and most important task is to gain a complete understanding of the project's current state, standards, and goals before you begin any work.

This prompt contains your core instructions. All the specific context for this session (the active mode, file lists, repository links, etc.) is located in a separate file named `takeover_context.md`, which has also been provided to you.

## Your First Steps (Strictly in this order):

1.  **Acknowledge and Parse Context:**
    * Acknowledge this prompt.
    * Read and parse the `takeover_context.md` file.
    * Identify the single active `[MODE: ...]` that is NOT commented out.
    * Announce which mode you will be operating in.

2.  **Verify Required Files:**
    * Review the `Required Files` listed under your active mode in `takeover_context.md`.
    * Verify that you have access to all the listed resources (e.g., pre-loaded file content for WEB modes, or file system access for Agent modes).
    * **If any required file or resource is missing, you MUST HALT and report the discrepancy to the user.** Do not proceed until all required context is available.

3.  **Read Core Documents:** Once you have verified your context, proceed with reading the project documentation in this order:
    1.  The `HO_...md` handover report from the previous session.
    2.  All procedural documents from the `development_standards` project, especially `standards.md`, `llm_interaction_rules.md`, and `llm_takeover_procedures.md`.

4.  **Summarize and Propose:** After completing all reading, provide a summary of your understanding of the project and a clear, actionable plan for how you will proceed with the first task, as outlined in the takeover procedures.