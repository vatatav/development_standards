# LLM Interaction Rules and Directives

This document provides a mandatory set of rules and directives for any LLM assistant working on this project. These rules are not optional. They are designed to ensure consistency, quality, and alignment with the user's development philosophy. You must review these rules upon taking over the project.

## I. Core Communication Rules

1.  **Language Discipline:** All of your responses, without exception, **must be in English**. The user may communicate in other languages, but your output (code, documentation, and conversational responses) must remain in English to ensure the consistency of project artifacts and logs.
2.  **Clarity and Justification:** Do not just provide a solution. Explain the "why" behind your suggestions. Discuss alternatives, pros, and cons. The goal is a collaborative partnership, not opaque command execution.

## II. Documentation and File Modification Rules

1.  **Respect Existing Content:** When asked to modify a document, your primary goal is to **preserve the existing content and structure**. Do not rewrite, summarize, or remove sections unless specifically instructed to do so.
2.  **Make Minimal, Targeted Changes:** Your modifications should be the minimum necessary to implement the user's request. Insert new text or adjust existing sentences where needed, but avoid refactoring the entire document.
3.  **Ground All Statements in Verifiable Facts:** Your reasoning and actions must be strictly grounded in the literal content of the provided files.
    * **No Structural Inference:** Do not infer or "hallucinate" structural elements like step numbers, sections, or headings that are not explicitly written in a document.
    * **Reference by Quotation:** When referring to a specific part of a file to justify an action, use its actual heading or quote the relevant text as a landmark. For example, state "After the section titled 'Finalize the Session'..." instead of "In Step 4...".
4.  **Adhere to Project Structure:** All file operations must conform to the established directory structure. Do not create non-standard folders like `History` or `old`. Always ensure that new files or folders align with the existing organizational hierarchy.

5.  **Ensure Completeness of Changes:** When modifying a document, always provide the full, final text of the affected section or file after changes are approved. This ensures clarity and prevents incomplete updates.

## III. Coding and Development Rules

1.  **Follow `standards.md`:** All code you generate or modify must strictly adhere to the guidelines in **the main `standards.md` document of the `most_comprehensive_approach` project.** This includes, but is not limited to:
    * PEP 8 styling.
    * Type Hints.
    * Google-style Docstrings.
    * Use of the `logging` module over `print()`.
    * Robust error handling.
2.  **Use the Correct Environment:** Be aware of the project-specific Conda environments. Any suggestions for package installation should follow the priority defined in the standards (Conda-forge first).

## IV. General Workflow

1.  **Consult the User Profile:** Refer to **the `user_profile_for_llm_assistance.md` file located in the workspace root** for broader context on the user's background, preferences, and goals.
2.  **Follow Procedures:** Strictly follow all defined procedures for logging, handover, and takeover as documented in the `most_comprehensive_approach` project.
3.  **Be Proactive (but careful):** You are encouraged to proactively identify potential issues or suggest improvements. However, these suggestions must align with the established standards and project philosophy.