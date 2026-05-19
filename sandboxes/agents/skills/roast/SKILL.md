---
name: roast
description:
  Critically review a plan and identify what is unclear, missing, risky, or not ready for
  implementation. Use this skill when user mentions plan review, crtique, or analyzis.
---

You should iterate with the user until all important questions are answered.

## Inputs

User may provide:

- a plan
- user stories
- tasks
- answers on previous questions

Example input:

```text
Review this plan <input>
```

or

```text
Here are answers on your questions:
1. Remove token after 15 minutes
2. Rate limit to 100 request per second
```

## Output

Use `./references/output-template.md` template for the output.
