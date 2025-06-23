# Project Lifecycle Guidelines

This document provides guidelines for managing projects within the `python_workspace`. It covers initiating new projects, potentially migrating existing ones, and considerations for project completion and maintenance phases.

Refer to [`standards.md`](python_workspace/documentation/standards.md:1) for detailed coding standards, directory structures, and Git workflow, which apply to all projects.

## I. Initiating a New Project

When starting a new project within `python_workspace/projects/`:

1.  **Define Project Scope and Goals:**
    *   Clearly articulate the objectives, features, and deliverables of the new project.
    *   Consider if any components can leverage or should be added to `shared_libs/`.

2.  **Create Project Directory:**
    *   Under `python_workspace/projects/`, create a new directory for your project.
    *   Use `snake_case` for the directory name (e.g., `my_new_data_analyzer`).

3.  **Establish Standard Internal Structure:**
    *   Inside your new project directory, create the standard internal structure:
        ```
        [project_name]/
        ├── src/
        │   ├── __init__.py
        │   └── main.py           # Main entry point
        ├── tests/
        │   └── __init__.py
        ├── logs/                 # For project-specific log files
        ├── data/                 # (Optional) For project-specific data files
        ├── environment.yml       # Conda environment definition
        ├── config.json           # Project configuration (gitignored if sensitive)
        ├── config.template.json  # Template for config.json
        └── README.md             # Project-specific README
        ```
    *   The LLM assistant can be tasked with creating these empty files and directories.

4.  **Create Conda Environment (`environment.yml`):**
    *   Define the Conda environment in `[project_name]/environment.yml`.
    *   Specify the Python version (e.g., 3.10, 3.11, or as appropriate).
    *   List all necessary base and project-specific dependencies (e.g., `pandas`, `requests`, `mypy`, `flake8`, `black`).
    *   Example:
        ```yaml
        name: my_new_project_env
        channels:
          - conda-forge
          - defaults
        dependencies:
          - python=3.11
          - pip
          - pandas
          - mypy
          - flake8
          - black
          # - other_dependencies
          # - pip:
          #   - pip_only_package
        ```
    *   Create and activate the environment:
        ```bash
        conda env create -f environment.yml
        conda activate my_new_project_env
        ```

5.  **Configuration (`config.json` and `config.template.json`):**
    *   Identify all configuration parameters needed for the project (e.g., API keys, file paths, thresholds).
    *   Create `config.template.json` with placeholders for sensitive values and reasonable defaults for non-sensitive ones.
    *   Instruct the user to create their `config.json` from this template and populate it. Ensure `projects/*/config.json` is in the root `.gitignore`.

6.  **Project-Specific `README.md`:**
    *   Write a comprehensive `README.md` for the project. It should include:
        *   Purpose and goals of the project.
        *   Setup instructions:
            *   How to create and activate the Conda environment.
            *   How to prepare `config.json` from `config.template.json`.
            *   Any other prerequisite setup steps.
        *   How to run the main script(s) or use the project.
        *   Brief overview of its internal structure if helpful.

7.  **Initial Logging Setup:**
    *   In the project's main entry point (e.g., `src/main.py`), import and use the `setup_logging` function from `shared_libs.custom_logger`.
    *   Configure it to write logs to the project's `logs/` directory.

8.  **Initial Git Commit for New Project:**
    *   Once the basic structure, environment file, README, and configuration templates are in place, make an initial Git commit for this new project.
    *   Example commit message: `feat([project_name]): initialize project structure and base configuration`

9.  **Update Development Logs:**
    *   Make an entry in `documentation/llm_assisted_development_log.md` noting the initiation of the new project.

## II. Migrating an Existing Project (Considerations)

If you have an existing project that you wish to integrate into this `python_workspace` and align with its standards:

1.  **Assess Compatibility:**
    *   Review the existing project against the standards in `documentation/standards.md`. Identify areas needing modification (directory structure, naming, coding style, dependency management, logging).
2.  **Plan Migration Steps:**
    *   Create a new project directory under `python_workspace/projects/`.
    *   Gradually refactor and move code into the standard structure.
    *   Create an `environment.yml` file, trying to match dependencies.
    *   Adapt configuration to use `config.json` and `config.template.json`.
    *   Integrate shared logging.
    *   Write a new project-specific `README.md`.
3.  **Version Control:** Consider if the existing project has its own Git history. You might:
    *   Start fresh with Git history within this monorepo structure.
    *   Attempt more complex Git strategies like subtree merges if preserving history is critical (this is advanced).
4.  **Iterative Approach:** Migration can be done iteratively. Prioritize aligning with the core structure and dependency management first.

## III. Project Completion ("Finished" State)

1.  **Definition of Done:** Clearly define what constitutes "completion" for a project or a major phase. This should align with the initial project goals.
2.  **Final Testing and Review:** Ensure all features are working as expected, tests pass, and documentation is up-to-date.
3.  **Logging Completion:**
    *   Make an entry in `documentation/llm_assisted_development_log.md` marking the project (or phase) as complete, along with the date and relevant Git commit.
    *   Example: `milestone([project_name]): Version 1.0 completed and deployed. All core features implemented.`
4.  **Tagging (Optional but Recommended):**
    *   Create a Git tag for the "completed" version (e.g., `git tag [project_name]-v1.0.0`).

## IV. Maintenance Phase (Post-Completion)

"Completed" rarely means no more changes. For maintenance (bug fixes) or subsequent minor enhancements:

1.  **Branching:**
    *   Always create new branches from the `main` branch (or the relevant release tag) for fixes or small features.
    *   Use `fix/[issue-description]` or `enhancement/[feature-description]` naming conventions.
2.  **Testing:** Rigorously test any changes, especially bug fixes, to ensure they resolve the issue without introducing regressions.
3.  **Pull Requests:** All maintenance changes should go through the standard Pull Request process.
4.  **Logging:** Document these changes in `documentation/llm_assisted_development_log.md`.
5.  **Versioning:** If applicable, increment patch versions for bug fixes (e.g., v1.0.1) or minor versions for small, backward-compatible enhancements (e.g., v1.1.0).

---
These guidelines aim to provide a consistent approach to managing projects throughout their lifecycle within this workspace.