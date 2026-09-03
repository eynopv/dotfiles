# Plan: <Feature Name> (Tier 3 - Complex/Critical)

<Short description of the critical feature.>

## 1. Goals & Non-goals
- **Goals:**
  - <Goal 1>
- **Non-goals:**
  - <Non-goal 1>

## 2. Relevant Files
<!-- Note: If cross-stack, partition into ### Back-end and ### Front-end subsections -->
- **To Be Modified:**
  - `path/to/modified_file.go`
- **To Be Created:**
  - `path/to/new_file.go`
- **Reference-Only (Do Not Modify):**
  - `path/to/reference_file.go`

## 3. Sequence/Flow Diagram (Mermaid)
```mermaid
sequenceDiagram
  # Sequence flow
```

## 4. Database & Code Impact Audit
- **DB Index & Schema Check:** <Confirm index presence, foreign keys, triggers, or migrations>
- **API / GraphQL Schema Contract (If Cross-Stack):**
  ```graphql
  # Define the exact contract (e.g., query, mutation, payload fields)
  ```
- **Proposed Signatures & Models:**
  ```go
  // Proposed struct or interface definitions
  ```

## 5. Requirements & Technical Task Decomposition
<!-- Note: Group requirements/tasks logically (e.g. Back-end, Front-end, API integration) -->
### REQ-001: <Technical Requirement Title>
- **Technical Description:** <Detailed explanation of the engineering logic>
- **Acceptance Criteria (Verification Rules):**
  - Given `<context>`, when `<action>`, then `<expected result>`.
- **Tasks:**
  - [ ] TASK-001: <Atomic step 1>
  - [ ] TASK-002: <Atomic step 2>

### REQ-002: <Technical Requirement Title>
- **Technical Description:** <Detailed explanation of the engineering logic>
- **Acceptance Criteria (Verification Rules):**
  - Given `<context>`, when `<action>`, then `<expected result>`.
- **Tasks:**
  - [ ] TASK-003: <Atomic step 3>

## 6. Testing & Verification Plan
- **Mocking & Coverage:** <Details on mocks, e.g., sqlmock and JSONB conversion constraints>
- **Compliance (`GEMINI.md`):** <Specify how standard/local rules are satisfied>
- **Validation Commands:** <Test/Lint commands for each layer>

## 7. Edge Cases, Risks & Error Boundaries
- **Edge Cases:** <Edge cases>
- **Risks & Rollback:** <Error handling, recovery, rollback plan, or performance concerns>
