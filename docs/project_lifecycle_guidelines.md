# Project Lifecycle Guidelines

## 1. Introduction & Philosophy

This document defines the standard lifecycle for all projects within the workspace. The goal is to provide a clear, consistent, and repeatable process for managing projects from conception and setup through active development to final completion and maintenance.

This lifecycle is designed for a multi-project environment where each project is a self-contained, version-controlled entity. Adherence to these phases ensures that all projects are structured uniformly, making them easier to manage, maintain, and hand over between developers or LLM assistants.

All phases must be executed in accordance with the rules defined in the `standards.md` and `llm_interaction_rules.md` documents.

## 2. Phase 1: Project Conception & Setup

This is the most critical phase, establishing a solid foundation for the project.

1.  **Define Scope and Goals:** Clearly articulate the project's objectives, key features, and deliverables before any work begins.
2.  **Create Project Directory:** Create a new, dedicated directory for the project in the appropriate category (e.g., `./03_projects/python/[project_name]/`). The project directory name must use `snake_case`.
3.  **Establish Standard Internal Structure:** Immediately populate the new directory with the standard internal structure:
    * `src/`
    * `docs/`
    * `logs/`
4.  **Add Foundational Files:** Create the following essential files in the project's root directory:
    * A comprehensive project-specific `README.md`.
    * A `LICENSE` file (e.g., MIT License).
    * A `.gitignore` file, based on the standard template.
    * Utility scripts (`generate_project_manifest.ps1`, `run_manifest_generator.bat`).
5.  **Initialize Git Repository:**
    * Initialize a new Git repository in the project root (`git init -b main`).
    * Add all foundational files (`git add .`).
    * Make the initial commit using the standard message format defined in `standards.md`, including the session identifier tag. Example: `feat: Initial commit of the [project_name] project (S0016-PRJ-C01-20250624-1)`.
6.  **Create Remote Repository:** Create a corresponding public repository on GitHub and push the initial commit.
7.  **Create Initial Logs:** Populate the `./logs/` directory by creating the project's first `llm_assisted_development_log.md`, `user_progress_log.md`, and `sessions.md` files, following the formats defined in `logging_procedures_guidelines.md`.

## 3. Phase 2: Iterative Development

This phase constitutes the day-to-day work of building the project.

1.  **Branching:** All new work (features, bug fixes) must be done in separate branches, following the Git strategy outlined in `standards.md` (e.g., `feature/...`, `fix/...`).
2.  **Coding:** All code must adhere strictly to the coding standards in `standards.md` (PEP 8, type hints, docstrings, etc.).
3.  **Committing:** Make small, atomic commits with clear messages that follow the Conventional Commits format, including the session identifier tag.
4.  **Pull Requests (PRs):** When a feature or fix is complete, open a Pull Request to merge the branch into `main`. The PR must have a clear description. This serves as a crucial review step, even for a solo developer.

## 4. Phase 3: LLM Session Management

Development is conducted in discrete, logged conversations with LLM assistants.

1.  **Session Initiation (Takeover):** A new development conversation begins with the Takeover procedure. A `TO_...md` file is created in `./logs/`, and new log entries are created with a new project-specific conversation number (e.g., `C02`).
2.  **Diligent Logging:** All significant actions, decisions, and insights during the conversation must be logged according to `logging_procedures_guidelines.md`.
3.  **Session Conclusion (Handover):** When a block of work is complete or the context limit is reached, the session is formally concluded using the Handover procedure. A `HO_...md` file is created in `./logs/`, and the session logs are finalized. A Git commit is made to save the state of the work done during the session.

## 5. Phase 4: Completion and Maintenance

1.  **Defining Completion:** A project or a major version is considered "complete" when all its defined goals and features have been implemented, tested, and documented.
2.  **Final Commit and Tagging:** Make a final commit for the release version. It is highly recommended to create a Git tag for this version (e.g., `git tag v1.0.0`).
3.  **Maintenance:** Post-completion work (bug fixes, minor enhancements) follows the same development lifecycle: create a new branch from `main`, perform the work, and merge via a Pull Request. These changes should increment the version number according to Semantic Versioning (e.g., `v1.0.1` for a bug fix).