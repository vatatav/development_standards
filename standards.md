# Workspace Standards and Development Guidelines

This document outlines the universal standards for directory structures, naming conventions, development workflow, and Git strategy for all projects within this workspace. Adherence to these standards is crucial for maintaining a clean, consistent, and collaborative environment.

## I. WORKSPACE AND PROJECT STRUCTURE

### 1. Top-Level Workspace Structure

The workspace is organized into numbered, domain-based "space" directories to ensure a clear separation of concerns. All new projects must be created within the appropriate space.

d:\mca_universe

├── 00_universe_meta/
│   └── logs/                 # Global logs for all sessions and user progress
├── 01_hyper_space/
│   ├── multi_clever_agents/
│   └── most_comprehensive_approach/
├── 02_python_space/
│   └── [project_name]/       # For Python application projects
├── 03_web_dev_space/
│   └── [project_name]/       # For web application projects
└── 99_archive/
└── [archived_item]/      # For old projects or historical files


### 2. Standard Project-Internal Structure

Every new project, regardless of its type (code, documentation, etc.), must begin with this minimal standard internal structure.

[project_name]/
├── docs/                 # For project-specific documentation and guides
├── logs/                 # For project-specific logs (session, progress, etc.)
├── .gitignore
├── LICENSE
└── README.md             # Project-specific explanations and setup


**Note on Project-Specific Additions:**
* **Code-Based Projects** (e.g., Python, Web) MUST add a `src/` directory to contain all source code.
* Projects may add other top-level directories as needed (e.g., `data/` for data files, `config/` for configuration), but these should be justified in the project's `README.md`.

### 3. Language and Naming Conventions

* **Language:** All code, file names, folder names, variables, functions, classes, comments, and documentation **must be in English.**
* **Default Naming Conventions:** The following conventions should be considered the default for all projects. Project-specific deviations (e.g., for different programming languages) must be documented in that project's `README.md`.
    * **File & Directory Naming:** Use `snake_case` (e.g., `custom_logger.py`, `multi_agent_framework/`).
    * **Variable & Function Naming:** Use `snake_case` (e.g., `user_count`, `calculate_total()`).
    * **Class & Type Naming:** Use `PascalCase` (also known as `CapWords`) (e.g., `FinancialTransaction`, `AgentConfig`).
    * **Constants:** Use `UPPER_SNAKE_CASE` (e.g., `MAX_RETRIES = 3`).

### 4. Environment and Dependency Management

* **Principle:** Every code-based project that has external dependencies **must include a file that defines its environment and lists its dependencies.** This file ensures that the project can be set up consistently by any developer or automated system.
* **Project-Specific Implementation:** The choice of tool (e.g., Conda, Pip, NPM, Maven) depends on the project's technology stack and must be documented in its `README.md`.

* **Example for Python Projects:**
    * **Environment:** Each Python project must use its own virtual environment (Conda is preferred).
    * **`environment.yml`:** A `environment.yml` file must be created for each project, specifying the Python version and all dependencies. Example:
        ```yaml
        name: my_project_env
        channels:
          - conda-forge
          - defaults
        dependencies:
          - python=3.10
          - pip
          - pandas
          - pip:
            - requests
        ```

### 5. Coding Standards and Practices

This section outlines the standards for writing clean, maintainable, and robust code. It is divided into universal principles applicable to all projects and specific standards for Python development.

#### 5.1. Universal Principles (Applicable to All Projects)

These principles represent a baseline for quality and should be applied to any type of project, regardless of the technology stack.

* **Readability and Simplicity:** Code should be written to be as clear and easy to understand as possible. Prefer simple, direct solutions over overly complex or "clever" ones.
* **Modularity:** Break down large, complex problems into smaller, manageable, single-responsibility functions, modules, or components.
* **Don't Repeat Yourself (DRY):** Avoid duplicating code. Encapsulate and reuse common logic in functions or classes.
* **Robust Error Handling:** Any operation that has the a-zA-Z to fail (e.g., file I/O, network requests, data parsing) must be wrapped in appropriate error-handling logic (`try-catch` blocks or equivalent).
* **Structured Logging:** Use a structured logging framework for recording application events, warnings, and errors. Avoid using simple `print()` or `console.log()` statements for application output, as they lack context and control.
* **In-Code Documentation:** All functions, methods, classes, and public modules must have clear documentation explaining their purpose, parameters, and return values (e.g., docstrings in Python, JSDoc in JavaScript). Add comments to explain complex or non-obvious business logic.
* **Resource Management:** Ensure that resources like file handles, network connections, or database connections are always properly closed or released, preferably using language features that automate this (e.g., `with` statements in Python, `try-with-resources` in Java).

#### 5.2. Python-Specific Standards

For any project involving Python code, the following standards are mandatory.

* **PEP 8:** All Python code must adhere to the [PEP 8 style guide](https://www.python.org/dev/peps/pep-0008/). It is highly recommended to use an automated formatter like `Black` to enforce this.
* **Entry Point:** Scripts intended to be run directly must use a `main()` function and an `if __name__ == '__main__':` block.
* **Type Hints:** Use type hints for all function/method signatures (arguments and return types) and for important variables. This is not optional.
    ```python
    from typing import List

    def process_items(items: List[str]) -> int:
        # function body
        return len(items)
    ```
* **Docstrings:** Write descriptive docstrings in English for every module, class, and function. Google style is preferred.
    ```python
    def my_function(param1: int) -> bool:
        """Does something interesting.

        Args:
            param1: The first parameter, representing...

        Returns:
            True if successful, False otherwise.
        """
        pass
    ```
* **Command-Line Arguments:** Use the `argparse` module for any script that accepts command-line arguments.
* **Shared Libraries:** For any code that is intended to be used by multiple projects, consider placing it in a dedicated shared library project within the `01_hyper_space/` or a similar category, rather than in a specific application project.

### 6. Configuration Management

* **Principle:** If a project requires configuration that includes sensitive values (e.g., API keys, passwords, connection strings), these values **must not** be committed to the repository.
* **Implementation:**
    * The sensitive values should be placed in a configuration file (e.g., `config.json`, `.env`).
    * This file **must** be listed in the project's `.gitignore` file.
    * A template file (e.g., `config.template.json`, `.env.example`) **must** be created and committed to the repository. This template should contain all the necessary configuration keys but with placeholder or empty values.

### 7. Recommended Tooling for Python Projects

For Python-based projects, it is highly recommended to use the following tools to ensure code quality and consistency. Configuration and integration should be done via `pyproject.toml` or other modern configuration files.

* **Formatting:** `Black` for opinionated, consistent code formatting.
* **Linting:** `Ruff` or `Flake8` for style guide enforcement and error checking.
* **Type Checking:** `Mypy` for static type analysis.
* **Import Sorting:** `isort` for automatically organizing imports.

**Automation via Pre-commit Hooks:**
Using `pre-commit` is the standard way to automate these checks. A `.pre-commit-config.yaml` should be created in the project root to configure the hooks.

## II. GUIDELINES FOR INITIATING NEW PROJECTS

The formal, step-by-step process for creating new projects is now detailed in the `project_lifecycle_guidelines.md` and `developer_quickstart.md` documents. Please refer to them for procedural guidance.

## III. DEVELOPMENT WORKFLOW AND GIT STRATEGY

This section defines the mandatory Git workflow for all projects.

### 1. Branches

* **`main`:** This branch should always reflect a stable, production-ready state. Direct commits to `main` are discouraged.
* **`develop` (Optional but Recommended):** A branch for integrating features. When features are stable here, they can be merged into `main`.
* **Feature Branches (`feature/`, `feat/`):** All new development (features, enhancements) must be done in feature branches.
    * Branch off from `develop` (if used) or `main`.
    * Naming: `feature/brief-description` or `feat/JIRA-123-brief-description`.
* **Bugfix Branches (`bugfix/`, `fix/`):** For fixing bugs.
    * Branch off from the branch where the bug exists (usually `main` or `develop`).
    * Naming: `bugfix/brief-description` or `fix/JIRA-456-fix-login-issue`.
* **Hotfix Branches (`hotfix/`):** For critical fixes directly on `main`.

### 2. Commits

* **Atomic Commits:** Each commit should represent a single logical change. Avoid large, unrelated changes in one commit.
* **Commit Messages:** Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.
    * Format: `<type>[optional scope]: <description>`
    * **Session Identifier Requirement:**
        * To ensure full traceability, every commit subject line MUST end with a session identifier tag.
        * **Format:** `(<S-GlobalNo>-<PRJ>-<C-ConvNo>-<Date>-<CommitSeqNo>)`
        * **Example Subject Line:** `feat(auth): add user registration endpoint (S0015-MAF-C01-20250623-1)`
        * **Commit Counter:** To manage the `[CommitSeqNo]`, a `Commit Counter` must be maintained in the header of the relevant project's `llm_assisted_development_log.md` for the current conversation.
    * **Guideline for LLM-Generated Commit Messages:**
        * When an LLM generates a multi-line commit message to be executed directly in a command-line terminal, it must be formatted using multiple `-m` flags.
        * The **first** `-m` flag is for the commit **subject**.
        * Each **subsequent** `-m` flag is for a **new paragraph or bullet point** in the commit **body**.
        * **Correct Command-Line Execution:**
            ```bash
            git commit -m "feat(auth): add endpoint (S0015-MAF-C01-20250623-1)" -m "Implement the API endpoint for new user registration."
            ```
* **Lint and Test Before Committing:** Ensure your code lints and passes relevant tests before committing (ideally automated with pre-commit hooks).

### 3. Pull Requests (PRs) / Merge Requests (MRs)

* All changes must go through a Pull Request process, even for solo developers (as a self-review step).
* **PR Description:** Clearly describe the changes made, the problem solved, and how to test. Link to relevant issues.
* **Code Review:** If working in a team, PRs must be reviewed by at least one other developer.
* **Merge Strategy:**
    * Prefer squash merges or rebase and merge for feature branches into `develop`/`main` to keep history clean.
    * Ensure the feature branch is up-to-date with the target branch before merging.
* **Delete Branch After Merge:** Delete feature/bugfix branches after they are merged.

### 4. Versioning (Optional)

* Consider using [Semantic Versioning (SemVer)](https://semver.org/) (e.g., `MAJOR.MINOR.PATCH`) for projects or shared libraries.
* Use Git tags to mark releases (e.g., `git tag v1.0.0`).