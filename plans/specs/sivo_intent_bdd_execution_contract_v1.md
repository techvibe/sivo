# Sivo Intent-Driven and BDD Execution Contract v1

Version: `1.0.0`  
Status: Normative

## SIVO-INTENT-001 Objective

All autonomous and human-coordinated work MUST be intent-driven first and behavior-verified second, so non-linear prompts can be transformed into deterministic execution safely.

### Acceptance criteria
- Every task includes an explicit intent contract with outcome boundaries.
- Every task includes at least one executable BDD scenario.
- Work cannot start if intent or BDD artifacts are missing.

## SIVO-INTENT-002 Intent contract structure

Required intent fields:
- `problem_statement`
- `desired_outcome`
- `non_goals`
- `success_signals`
- `constraints`

### Acceptance criteria
- Intent fields are schema-validated.
- Intent is immutable once task execution begins unless a signed steering update is applied.
- Intent changes produce a new version and traceable diff record.

## SIVO-INTENT-003 BDD scenario structure

Each scenario MUST define:
- `id`
- `given`
- `when`
- `then`

### Acceptance criteria
- Scenario steps are machine-readable and test-mapped.
- At least one `then` assertion maps to measurable acceptance evidence.
- Scenario failures block task completion.

## SIVO-INTENT-004 Intent-to-behavior traceability

Each BDD scenario must reference its parent intent and associated spec sections.

### Acceptance criteria
- Trace links exist from intent -> scenario -> test -> evidence.
- Dashboard can display intent coverage and failing behavior clauses.
- Missing trace links are conformance failures.

## SIVO-INTENT-005 Non-linear prompt steering

User prompts may update priorities, sequencing, and constraints, but MUST preserve determinism and policy boundaries.

### Acceptance criteria
- Steering updates are recorded as signed prompt-intent events.
- Impacted tasks are re-planned with updated dependencies and risk markers.
- Unauthorized steering requests are rejected by policy with diagnostics.

## SIVO-INTENT-006 Execution guardrails

Intent-driven and BDD gates run before mutation operations.

### Acceptance criteria
- Preflight fails when behavior coverage is below configured threshold.
- Intent drift detection triggers task pause and human review.
- Override requires role-scoped approval and expiry.
