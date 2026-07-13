---
name: draft
description:
  Turn requirements into a structure plan. Use this skill when user wants to plan a feature, break a
  feature into user stories and tasks, or update an existing plan. You must always use this skill
  for planning implementation regardless of how small.
---

- DO NOT implement the feature, only plan it.
- MUST strictly adhere to the structure defined in `./references/plan-template.md`.
- DO NOT omit any sections in template.
- DO mark sections with 'N/A' if a section is not applicable

## Step by step

1. **Explore the codebase.** Do not write a generic plan.
   - List the root directory and key subdirectories.
   - Read the README, package manifests, and config files.
   - Identify the main source files, frameworks, and dependencies.
   - Look at existing tests to understand coverage and conventions.
2. **Ask user.** Do not guess.
   - Ask clarifying questions.
   - Define clear requirements with user.
3. **Map the requirement to reality.**
   - Note which files/modules will be affected.
   - Record actual technologies in use (language, DB, framework).
   - Flag files that must stay unchanged vs. be modified.
4. **Write a concrete plan** based on what you found, not assumptions.
5. **Verify Template Compliance.** Before presenting the plan to the user, re-read
   `./references/plan-template.md` and ensure your draft matches every header and section.
