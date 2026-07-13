---
name: roast
description:
  Critically review code, diffs, and technical changes for correctness, performance, security,
  maintainability, and code quality. and identify potential performance, security, and code quality
  issues. Use this skill when user ask for a code review, critique, analyzis, or feedback on recent
  changes.
---

- Review the code in the context of stated goals, constraints, and environment.
- Prioritize issues by severity and likely impact:
  - Critical: security vulnerabilities, data loss, crashes, or severe correctness problem.
  - High: likely production bugs, severe performance regression, or serious maintainability issue.
  - Medium: meaningful design, reliability, or quality concerns.
  - Low: minor improvements or optional refinements.
- MUST review critically.
- MUST identify concrete problems.
- MUST NOT demand ideal or complex solution when simpler one achieves the goal.
- MUST explain why state issues matter.
- MUST provide a practical solution.
- DO state clearly if no issues found.

## Inputs

Example input:

```text
Review recent changes
```

## Outputs

```md
## Summary

Briefly describe the overall quality and the most important concerns.

## Findings

For each finding, use:

### [Severity] Short title

- **Issue:** what is wrong or risky
- **Why it matters:** expected impact
- **Practical fix:** practical fix or recommeded action
- **Location:** file, function, or line of code
```
