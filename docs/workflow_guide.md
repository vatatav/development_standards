# Workspace Workflow Guide

This document serves as a practical guide and quick reference for the standard workflows used in this `python_workspace`. It consolidates key procedures for daily development, project management, and LLM collaboration.

## 1. Core Philosophy

The primary goal of this workspace is to create a robust, maintainable, and scalable environment for Python projects. We achieve this through standardized structures, documented procedures, and a disciplined approach to version control and code quality, often with the assistance of an LLM.

## 2. Managing Projects

### How do I start a new project?
The complete process for initiating a new project, from creating the directory to setting up the environment, is detailed in `documentation/project_lifecycle_guidelines.md`.

### How do I migrate an existing project?
Considerations and steps for migrating an older, external project to align with the standards of this workspace are also covered in `documentation/project_lifecycle_guidelines.md`.

## 3. Daily Development Workflow

### What's the first thing I should do when starting work?
1.  Open your preferred terminal (e.g., the VS Code integrated terminal).
2.  Activate the specific Conda environment for the project you are working on (e.g., `conda activate financial_tracker`).
3.  Navigate to the project workspace directory (`d:\AI_projects\roo_code_LLM_universe\python_workspace\`).
4.  Run `git status` to check the current state of your repository.

### How should I use Git branches?
All new work (features, bug fixes, documentation changes) should be done on a dedicated branch to keep the `main` branch stable. The full branching strategy is outlined in `documentation/standards.md`.

### When should I commit my work?
Commit your work at logical milestones. Each commit should represent a single, atomic change. The assisting LLM may remind you at key points, but you can initiate a commit whenever you feel a logical unit of work is complete. Commit message conventions are detailed in `documentation/standards.md`.

### How do I use the code quality tools?
* **Mypy, Flake8, and Black** should be installed in each project-specific Conda environment (e.g., `conda install -c conda-forge mypy flake8 black`).
* **VS Code** should be configured to use these tools from the active interpreter.
    * Set `"mypy.runUsingActiveInterpreter": true`.
    * Set `"python.linting.flake8Enabled": true`.
    * Set `"editor.defaultFormatter": "ms-python.black-formatter"` for Python files.
    * Enable `"editor.formatOnSave": true` for automatic formatting.

## 4. LLM Collaboration Workflow

### How do I ask an LLM to hand over the project?
To initiate the handover process, give the assisting LLM a simple command like **"Projeyi devret."** The LLM is required to follow the steps outlined in `documentation/llm_handover_procedures.md`.

### How do I onboard a new LLM?
To bring a new LLM up to speed, you should provide it with an initial prompt that points it to the takeover procedure document. The process is detailed in `documentation/llm_takeover_procedures.md`.

### How are the log files updated?
* `llm_assisted_development_log.md`: A chronological log of development activities and key decisions, updated by the LLM with your approval, typically before a commit.
* `user_progress_log.md`: Your personal log for tracking learning and insights. You can ask the LLM to help draft entries.
* `user_profile_for_llm_assistance.md`: A profile to help the LLM understand your preferences. It can be updated over time.

## 5. Workspace Maintenance

### Where should I store old files or historical artifacts?
To keep the version-controlled workspace clean, all historical artifacts, old versions of files, or conversational logs **must** be stored outside of the `python_workspace` directory (e.g., in a separate `d:\AI_projects\roo_code_LLM_universe\old_files\` directory). This is a strict standard defined in `documentation/standards.md`.