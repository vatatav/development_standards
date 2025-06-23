# Codebase Standards and Development Guidelines

This document outlines the coding standards, directory structures, naming conventions, project initiation guidelines, development workflow, and Git strategy for projects within this Python workspace. Adherence to these standards is crucial for maintaining a clean, consistent, and collaborative development environment.

## I. GENERAL CODEBASE STRUCTURE AND STANDARDS

### 1. Main Directory Structure

The main directory structure is as follows:

```
python_workspace/
├── projects/
│   └── [project_name]/   # Placeholder for individual projects
├── shared_libs/
│   ├── __init__.py
│   ├── custom_logger.py
│   └── pdf_utils.py
├── documentation/
│   └── standards.md      # This document
├── .gitignore
└── README.md             # General README for the main codebase
```

### 2. Project-Specific Directory Structure

Each project (e.g., `projects/financial_tracker/`) must have an internal structure like this:

```
[project_name]/
├── src/
│   ├── __init__.py
│   └── main.py           # Main entry point for the project
├── tests/
│   └── __init__.py
├── logs/                 # Log files for this project
├── data/                 # (Optional) For project-specific data files
├── environment.yml       # Conda environment definition file
├── config.json           # Project configuration file (gitignored if sensitive)
├── config.template.json  # Template for config.json
└── README.md             # Project-specific explanations
```
**Note on Archival/Historical Folders:** To keep the project workspace clean and focused on active development files, do not create additional `History` or `old` subdirectories within any project folder or the `python_workspace` root. This is a strict standard. All historical artifacts, old versions of files, or conversational logs should be stored in the dedicated `d:\AI_projects\roo_code_LLM_universe\old_files\` directory, which is outside the version-controlled workspace. Assisting LLMs should verify compliance with this standard during handovers.

### 3. Language and Naming Conventions

*   **Language:** All in-code elements (variables, functions, class names), file names, and folder names must be in **English**.
*   **Documentation:** Docstrings and comments must be in **English**.
*   **File Naming:** Use `snake_case` for Python files and directories (e.g., `custom_logger.py`, `financial_tracker/`).
*   **Variable Naming:** Use `snake_case` for variables and function names (e.g., `user_count`, `calculate_total()`).
*   **Class Naming:** Use `PascalCase` (also known as `CapWords`) for class names (e.g., `FinancialTransaction`).
*   **Constants:** Use `UPPER_SNAKE_CASE` for constants (e.g., `MAX_RETRIES = 3`).

### 4. Python Environment and Dependency Management

*   **Environment:** Each project must use its own Conda virtual environment.
*   **`environment.yml`:** An `environment.yml` file must be created for each project.
    *   Specify the Python version (e.g., Python 3.10 or 3.11).
    *   List base dependencies (e.g., `python`, `pip`). Project-specific dependencies are added here.
    *   Example structure:
        ```yaml
        name: my_project_env
        channels:
          - conda-forge
          - defaults
        dependencies:
          - python=3.10
          - pip
          # - pandas
          # - requests
          # - etc.
          - pip:
            # - package_from_pip
        ```
*   **Package Installation Priority:**
    1.  `conda install -c conda-forge <package_name>`
    2.  `conda install <package_name>` (from default channels)
    3.  `pip install <package_name>` (for packages not available on Conda)

### 5. Coding Standards and Practices

*   **PEP 8:** All Python code must adhere to the [PEP 8 style guide](https://www.python.org/dev/peps/pep-0008/). Pay special attention to line length (E501 - aim for 79 characters for code, 72 for docstrings/comments, but Black formatter will handle this mostly).
*   **Entry Point:** Scripts intended to be run directly should use an `if __name__ == '__main__':` block and a `main()` function.
    ```python
    def main():
        # Main logic here
        pass

    if __name__ == '__main__':
        main()
    ```
*   **Functions:**
    *   Create separate functions for specific, well-defined tasks.
    *   Break down large functions into smaller, manageable sub-functions.
    *   Group logically related functions in the same module (`.py` file).
*   **Command-Line Arguments:** Use the `argparse` module for scripts that take command-line arguments. Implement a `get_args()`-like function.
    ```python
    import argparse

    def get_args():
        parser = argparse.ArgumentParser(description="Script description.")
        parser.add_argument('--input', required=True, help='Input file path')
        # Add other arguments
        return parser.parse_args()

    # In main():
    # args = get_args()
    # process_file(args.input)
    ```
*   **Error Handling:** Implement robust error handling using `try-except` blocks for operations with error potential (e.g., file I/O, API calls, data conversions). Be specific with exception types.
    ```python
    try:
        with open('file.txt', 'r') as f:
            content = f.read()
    except FileNotFoundError:
        logging.error("File not found.")
    except IOError:
        logging.error("Error reading file.")
    except Exception as e:
        logging.error(f"An unexpected error occurred: {e}")
    ```
*   **Logging:**
    *   Use the standard `logging` module instead of `print()` for application events, errors, and debugging information.
    *   A basic logging configuration function is provided in [`shared_libs/custom_logger.py`](python_workspace/shared_libs/custom_logger.py:1). This function should set up log format, level (default to INFO), and direct logs to a file in the project-specific `logs/` folder (e.g., `app.log`).
    *   Example usage in a project's `main.py`:
        ```python
        import logging
        # Assuming custom_logger is in PYTHONPATH or installed
        # from shared_libs.custom_logger import setup_logging

        # setup_logging(project_log_dir='path/to/project/logs')
        # logging.info("Application started.")
        ```
*   **Type Hints:** Use type hints for function definitions (arguments and return types) and important variables. This improves code readability and allows for static analysis.
    ```python
    from typing import List, Dict

    def process_data(data: List[Dict[str, str]]) -> int:
        # implementation
        return 0
    ```
*   **Docstrings:** Write descriptive docstrings in English for every module, class, and function. Google style is preferred.
    *   **Module:** Explain the purpose of the module and its contents.
    *   **Function/Method:** Describe what the function does, its arguments (`Args:`), and what it returns (`Returns:`). Mention any exceptions raised (`Raises:`).
    ```python
    """This module provides utility functions for X."""

    def my_function(param1: int, param2: str) -> bool:
        """
        Does something interesting.

        Args:
            param1: The first parameter.
            param2: The second parameter.

        Returns:
            True if successful, False otherwise.

        Raises:
            ValueError: If param2 is invalid.
        """
        # ...
        pass
    ```
*   **Comments:** Add comments (in English) to explain complex or non-obvious parts of the code. Avoid over-commenting simple code.
*   **Efficient Code:** Prefer list comprehensions, generator expressions, and Python's built-in functions where appropriate for conciseness and performance.
*   **Resource Management:** Use the `with` statement (context managers) for operations that use resources that need to be properly closed or released (e.g., file handling, database connections).
    ```python
    with open('data.txt', 'r') as f:
        # process file
        pass
    ```
*   **Shared Libraries (`shared_libs`):**
    *   [`custom_logger.py`](python_workspace/shared_libs/custom_logger.py:1): Provides a configurable logging setup.
    *   [`pdf_utils.py`](python_workspace/shared_libs/pdf_utils.py:1): Contains functions for PDF text extraction, designed to be flexible and extensible.

### 6. Configuration Management

*   Use a configuration file named `config.json` for each project, located at `projects/[project_name]/config.json`.
*   If `config.json` contains sensitive information (API keys, passwords), it **must** be added to `.gitignore` (a general rule `projects/*/config.json` is already in the root `.gitignore`).
*   For each `config.json`, a `config.template.json` file must be created and committed to the repository. This template should contain placeholders or examples instead of actual sensitive values.
    *   Example `config.template.json`:
        ```json
        {
          "api_key": "YOUR_API_KEY_HERE",
          "database_url": "your_db_url_or_placeholder",
          "setting_x": "default_value"
        }
        ```

### 7. Automation Tools (Setup and Configuration Recommendation)

It is highly recommended to use the following tools for code quality:
*   **`Black`**: For opinionated code formatting.
*   **`Flake8`**: For linting (style guide enforcement, error checking).
    *   Consider plugins like `flake8-bugbear`, `flake8-comprehensions`.
*   **`Mypy`**: For static type checking.
*   **`isort`**: For sorting imports automatically.

**Integration with Pre-commit Hooks:**
Using `pre-commit` is strongly recommended to automate these checks before commits.
1.  Install `pre-commit`: `pip install pre-commit`
2.  Create a `.pre-commit-config.yaml` file in the root of `python_workspace/`:
    ```yaml
    # See https://pre-commit.com for more information
    # See https://pre-commit.com/hooks.html for more hooks
    repos:
    -   repo: https://github.com/pre-commit/pre-commit-hooks
        rev: v4.5.0 # Use the latest stable version
        hooks:
        -   id: trailing-whitespace
        -   id: end-of-file-fixer
        -   id: check-yaml
        -   id: check-added-large-files
    -   repo: https://github.com/psf/black
        rev: 24.4.2 # Use the latest stable version
        hooks:
        -   id: black
            language_version: python3.10 # Or your target Python version
    -   repo: https://github.com/PyCQA/flake8
        rev: 7.0.0 # Use the latest stable version
        hooks:
        -   id: flake8
    -   repo: https://github.com/PyCQA/isort
        rev: 5.13.2 # Use the latest stable version
        hooks:
        -   id: isort
            name: isort (python)
    # -   repo: https://github.com/pre-commit/mirrors-mypy
    #     rev: 'v1.10.0'  # Use the latest stable version
    #     hooks:
    #     -   id: mypy
    #         args: [--no-strict-optional, --ignore-missing-imports]
    #         # additional_dependencies: [types-requests, ...] # Add types for libraries
    ```
3.  Install the git hooks: `pre-commit install`
Now, these tools will run automatically on `git commit`.

**IDE Integration (Example: VS Code):**
*   Install Python extension for VS Code.
*   Configure settings (`.vscode/settings.json` or user settings):
    ```json
    {
        "python.formatting.provider": "black",
        "python.linting.flake8Enabled": true,
        "python.linting.mypyEnabled": true, // If using Mypy
        "editor.formatOnSave": true,
        "[python]": {
            "editor.defaultFormatter": "ms-python.black-formatter" // if black formatter extension is used
        },
        "python.sortImports.path": "isort", // if isort is installed and in PATH
        "editor.codeActionsOnSave": {
            "source.organizeImports": "explicit" // For isort or similar
        }
    }
    ```

## II. GUIDELINES FOR INITIATING NEW PROJECTS

1.  **Create Project Directory:** Under `projects/`, create a new directory for your project (e.g., `projects/my_new_project/`). Use `snake_case`.
2.  **Internal Structure:** Set up the standard internal project structure as defined in section I.2.
3.  **`environment.yml`:** Create the Conda environment file, specifying Python version and dependencies.
4.  **`config.template.json`:** Create a template for the project's configuration.
5.  **`README.md`:** Create a project-specific `README.md` explaining its purpose, setup (Conda env, `config.json`), and how to run it.
6.  **Add to `.gitignore` (if needed):** Ensure any new project-specific sensitive files or large data files are covered by `.gitignore` patterns.
7.  **Initial Commit:** Make an initial commit for the new project structure.

## III. DEVELOPMENT WORKFLOW AND GIT STRATEGY

### 1. Branches

*   **`main` (or `master`):** This branch should always reflect a stable, production-ready state. Direct commits to `main` are discouraged.
*   **`develop` (Optional but Recommended):** A branch for integrating features. When features are stable here, they can be merged into `main`.
*   **Feature Branches (`feature/`, `feat/`):** All new development (features, enhancements) must be done in feature branches.
    *   Branch off from `develop` (if used) or `main`.
    *   Naming: `feature/brief-description` or `feat/JIRA-123-brief-description` (e.g., `feature/user-authentication`).
*   **Bugfix Branches (`bugfix/`, `fix/`):** For fixing bugs.
    *   Branch off from the branch where the bug exists (usually `main` or `develop`).
    *   Naming: `bugfix/brief-description` or `fix/JIRA-456-fix-login-issue`.
*   **Hotfix Branches (`hotfix/`):** For critical fixes directly on `main` that need to be deployed urgently.
    *   Branch off from `main`.
    *   After deployment, merge back into `main` and `develop`.

### 2. Commits

* **Atomic Commits:** Each commit should represent a single logical change. Avoid large, unrelated changes in one commit.
* **Commit Messages:** Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification. This helps in generating changelogs and understanding history.
    * Format: `<type>[optional scope]: <description>`
    * Example types: `feat` (new feature), `fix` (bug fix), `docs` (documentation), `style` (formatting, PEP8), `refactor`, `test`, `chore` (build process, auxiliary tools).
    * Example:
        ```
        feat: add user registration endpoint

        Implement the API endpoint for new user registration.
        Includes input validation and password hashing.
        ```
        ```
        fix: correct calculation error in payment processing

        The discount was being applied twice. This commit corrects
        the logic to apply it only once.
        Closes #123
        ```
    **_Guideline for LLM-Generated Commit Messages_**

    **_When an LLM generates a multi-line commit message to be executed directly in a command-line terminal, it must be formatted using multiple `-m` flags to avoid shell parsing errors. Pasting a single string with newlines is not a reliable method._**

    * **_The **first** `-m` flag is used for the commit **subject**._**
    * **_Each **subsequent** `-m` flag is used for a **new paragraph or bullet point** in the commit **body**._**

    **_Correct Command-Line Execution:_**
    ```bash
    git commit -m "feat: add user registration endpoint" -m "Implement the API endpoint for new user registration." -m "Includes input validation and password hashing."
    ```

    **_Incorrect Format (for direct terminal pasting):_**
    ```bash
    # This format will cause errors if pasted directly into the command line.
    # It is only suitable for use when Git opens a separate text editor.

    git commit -m "feat: add user registration endpoint

    Implement the API endpoint for new user registration.
    Includes input validation and password hashing."
    ```
* **Lint and Test Before Committing:** Ensure your code lints, passes type checks, and passes relevant tests before committing (ideally automated with pre-commit hooks).

### 3. Pull Requests (PRs) / Merge Requests (MRs)

*   All changes, especially to `shared_libs`, `develop`, or `main`, must go through a Pull Request process, even for solo developers (as a self-review step).
*   **PR Description:** Clearly describe the changes made, the problem solved, and how to test. Link to relevant issues.
*   **Code Review:** If working in a team, PRs must be reviewed by at least one other developer.
*   **Merge Strategy:**
    *   Prefer squash merges or rebase and merge for feature branches into `develop`/`main` to keep history clean.
    *   Ensure the feature branch is up-to-date with the target branch before merging.
*   **Delete Branch After Merge:** Delete feature/bugfix branches after they are merged.

### 4. Versioning (Optional)

*   Consider using [Semantic Versioning (SemVer)](https://semver.org/) (e.g., `MAJOR.MINOR.PATCH`) for projects or shared libraries, especially if they are to be consumed by others.
*   Use Git tags to mark releases (e.g., `git tag v1.0.0`).

---

By following these standards, we aim to build a robust, maintainable, and collaborative codebase.