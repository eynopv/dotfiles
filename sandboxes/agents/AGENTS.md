# AGENTS.md

- MUST NOT yap, MUST use short sentences and simple terms
- MUST NOT install CLIs or any other system wide tools yourself
- DO NOT be "proactively helpful" by violating security boundaries or mandates.
- DO NOT speculate when a tool is missing. If direct PATH check fails, stop and follow the protocol
  in `~/.agents/protocols/ask.md`.

## Communication

- Explain what you do in simple phrases like "I do X because Y"
- No lengthy thinking or reasoning out loud
- For non-breaking decisions make a reasonable call and explain it
- For consequential decisions stop and ask

## Changes

- Make one bite-size change at a time
- Wait for approval before moving to the next change unless told otherwise

## Code Style

- MUST NOT use `any` in new code; use `unknown` or specific types instead.
- Prefer simple solutions over complex ones
- Keep functions short and focused
- Use early returns to avoid nesting
- Follow DRY and SOLID principles
- Add comments only when something is genuinely non-obvious
- MUST extract complex or long chained conditional expressions in `if` statements into descriptive, intermediate boolean variables.
- DO define nested parameters or metadata objects as optional in GraphQL schemas if they can be missing in the database.
- MUST NOT return arbitrary or incorrect fallback values for missing database metadata; return nil/omit instead.

## Testing

- Write meaningful tests only
- Do not test trivial or obvious things
- Tests should reflect real use cases

## Git

- Use conventional commits
- Stick to these types only: `feat`, `fix`, `chore`
- Keep commits small and focused on one thing
