---
name: roast
description:
  Critically review code, diffs, and technical changes for correctness, performance, security,
  maintainability, and code quality. Identify potential issues and provide actionable, high-quality
  feedback. Use this skill when the user asks for a code review, critique, analysis, or feedback.
---

## Review Instructions

- Review the code critically in the context of stated goals, constraints, runtime, and language standards.
- **MUST** treat comments as potential code smells. Code should be self-documenting. 
- **MUST** flag redundant, over-verbose, conversational, or historical diary-style comments that explain *what* or *how* instead of a non-obvious *why*.
- **MUST NOT** accept "migration/port parity" or "temporary translation" as an excuse for compromised security, unmanageable structure, or fragile runtime logic.
- **MUST** critically audit the codebase for security flaws:
  - Raw user input rendering leading to XSS.
  - Manual, unparameterized query building leading to SQL Injection.
  - Lack of type safety and boundary checking on public APIs.
- **MUST** look out for high-impact performance bottlenecks:
  - Redundant compilation of regexes or parsers inside loops.
  - Synchronous filesystem or process I/O blocking single-threaded event loops.
  - Heavy or repeated memory allocations and encoding conversions on unbounded raw data streams.
- **MUST** prioritize findings by severity:
  - **Critical:** security vulnerabilities (XSS, SQL Injection), data loss, crashes, or severe correctness problems.
  - **High:** likely production bugs, severe performance regressions, or serious maintainability issues.
  - **Medium:** meaningful design, scalability, reliability, or structural code quality concerns.
  - **Low:** minor improvements or optional refinements.
- **MUST** explain exactly why each identified issue matters in a real-world scenario.
- **MUST** provide a practical, clean, and concise code solution or structural recommendation for each finding.
- **MUST NOT** suggest over-engineered or excessively complex patterns when a simpler, idiomatic solution achieves the goal.
- **DO** state clearly and directly if no issues are found.

## Inputs

Example input:

```text
Review recent changes
```

## Outputs

```md
## Summary

Briefly describe the overall quality of the code and the most critical architectural/maintainability concerns.

## Findings

For each finding, use:

### [Severity] Short title

- **Issue:** what is wrong or risky
- **Why it matters:** expected real-world impact
- **Practical fix:** recommended action and copy-pasteable, clean code snippet/workaround
- **Location:** file, function, or line of code
```
