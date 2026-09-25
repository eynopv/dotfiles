# Memory Protocol

All learnings, memories, technical decisions, and plans must be documented and structured according
to this protocol.

## Project Structure & Locations

The path of local memory is always recorded and checked relatively to the local `AGENTS.md` file.
All project-related files MUST be stored under the `memories/` directory located in the same
directory as the local `GEMINI.md` file:

```text
<directory-of-local-AGENTS.md>/
├── AGENTS.md
└── memories/
    ├── learnings.md           # General project-level learnings and workflows
    ├── <feature-name>.md      # Feature-specific or plan-specific learnings (e.g., authentication.md)
    ├── decisions.md           # System-wide architectural and technical decisions
    └── plans/                 # Feature implementation plans (managed by draft skill)
        └── <plan-name>.md
```

- **Fallback Rule:** If the project does not have a local `AGENTS.md` file, the memories and plans
  MUST be stored in and resolved relatively to the global `.agents` directory
  (`~/.agents/memories/`).
- **Index Requirement:** All files in the `memories/` directory MUST be listed and indexed in the
  local `AGENTS.md` under the "Memories & Plans" section using relative paths from that `GEMINI.md`
  file. If using the global `.agents` directory fallback, files must be indexed in
  `~/.agents/AGENTS.md`.
- **Global / Personal Memories:** MUST be recorded in the global personal memory
  (`~/.agents/AGENTS.md`).
- **No Clutter:** MUST NOT write memories, learnings, decisions, or plans to other directories.
