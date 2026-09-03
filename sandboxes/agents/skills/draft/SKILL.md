---
name: draft
description:
  Turn requirements into a structured plan. Use this skill when the user wants to plan a feature,
  break a feature into user stories and tasks, update an existing plan, or draft a step-by-step
  implementation layout. You must always use this skill for planning implementation regardless
  of how small, selecting the correct complexity tier to avoid plan bloat.
---

- DO NOT implement the feature, only plan it.
- MUST assess task complexity and select the correct Tier-specific template.
- MUST strictly adhere to the structure of the chosen template file.
- DO NOT omit any sections in the chosen template.

## Complexity Classification Rules

### Tier 1: Small / Surgical (Template: `plan-template-tier1.md`)
*   **Triggers:** Single-file refactoring, minor bug fixes, simple config updates, or small visual changes.
*   **Aesthetic:** Extremely lightweight, fast, no ceremonial overhead.

### Tier 2: Medium Feature (Template: `plan-template-tier2.md`)
*   **Triggers:** Multi-file changes, adding internal modules, creating utilities, or helper migrations.
*   **Aesthetic:** Focuses on affected files, assumptions, and clear task decomposition.

### Tier 3: Complex / Critical (Template: `plan-template-tier3.md`)
*   **Triggers:** Changes to real-time or payment flow, DB schema/migrations, multi-party integrations, async event buses, or **cross-stack (front-end & back-end) features**.
*   **Aesthetic:** Fully-featured, containing sequence diagrams, database index checks, explicit mocking strategies, and safety boundaries.

## Relevant Files Grounding Rules
When listing files in the **Relevant Files** section of any template, you MUST:
1. **Verify Existence:** Never list a file path unless you have explicitly verified its existence or planned its exact creation.
2. **Classify Actions Strictly:**
   - **To Be Modified:** Only files that will have code altered or added.
   - **To Be Created:** Entirely new files (e.g., new test suites, migration scripts).
   - **Reference-Only:** Code or config files that you have read to understand context but MUST remain completely untouched.
3. **Cross-Stack Partitioning:** If the change involves both front-end and back-end, divide the "Relevant Files" section into explicit `### Back-end` and `### Front-end` subheadings.
4. **Keep it Conservative:** Only list files directly involved in or read to understand the change. Do not dump directories.

## Step by step

1. **Explore the codebase.** Do not write a generic plan.
   - List key directories and locate exact target source code files.
   - Read relevant schemas, models, manifests, and configurations.
   - Identify the main source files, frameworks, and dependencies.
   - Look at existing tests to understand local mocking libraries, assertions, and conventions.
2. **Ask user. Do not guess.**
   - Ask clarifying questions if the requirement has ambiguities or open questions.
   - Define clear requirements with the user before finalizing the plan.
3. **Determine the Complexity Tier.**
   - Evaluate the scope, safety risks, and systems affected.
   - Categorize the task into **Tier 1 (Surgical)**, **Tier 2 (Medium)**, or **Tier 3 (Complex/Critical)**.
4. **Map the requirement to reality.**
   - Note which files/modules will be affected, and which must remain unchanged.
   - Record actual technologies and libraries in use (language, DB, framework).
   - If querying columns in high-throughput or real-time paths (Tier 3), verify if database indices exist or need to be added.
   - **If Cross-Stack:** Always draft the API or GraphQL schema contract *first* as the bridge between front-end and back-end.
5. **Write a concrete plan.**
   - Based strictly on what you found in the codebase, not on assumptions.
   - Use the appropriate Tier template from `/references/`.
6. **Verify Template Compliance.**
   - Before presenting the plan to the user, re-read the selected template in `./references/` and ensure your draft matches every header and section.
