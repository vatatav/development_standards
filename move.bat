REM === Navigate to the project directory ===
cd d:\mca_universe\02_methodologies\development_standards

REM === Create the new documentation directory ===
mkdir docs

REM === Delete the framework document that doesn't belong here ===
del custom_agent_framework.md
REM Deleting the backup/variant as well
del LSTcustom_agent_framework.md


REM === Move all the procedural documents into the docs folder ===
move llm_handover_procedures.md docs\
move llm_interaction_rules.md docs\
move llm_takeover_procedures.md docs\
move llm_takeover_prompt.md docs\
move llm_takeover_prompt_WEB.md docs\
move logging_procedures_guidelines.md docs\
move project_lifecycle_guidelines.md docs\
move workflow_guide.md docs\