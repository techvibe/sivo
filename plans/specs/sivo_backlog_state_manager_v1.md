# Sivo Backlog State Manager v1

Version: `1.0.0`  
Status: Normative

## SIVO-BACKLOG-001 Objective

Sivo MUST provide native backlog state storage, prioritization, and execution orchestration so teams can operate without external task tools.

### Acceptance criteria
- Backlog entities are first-class protocol objects linked to sessions and code lineage.
- Backlog CRUD, workflow transitions, and prioritization APIs are available.
- Backlog state changes are auditable and replayable.

## SIVO-BACKLOG-002 Canonical entities

- `initiative`
- `epic`
- `task`
- `dependency`
- `risk`
- `decision`
- `execution_run`

### Acceptance criteria
- Entity schemas are versioned and validated.
- Each entity has ownership, priority, status, and traceability fields.
- Cross-entity references are integrity-checked.

## SIVO-BACKLOG-003 Native prioritization model

Priority score factors:
- strategic value
- user impact
- technical risk
- compliance urgency
- dependency criticality
- effort estimate

### Acceptance criteria
- Priority formula is versioned and explainable.
- AI suggestions do not auto-promote priority without configured policy.
- Priority changes generate justification artifacts.

## SIVO-BACKLOG-004 Autonomous planning and execution

Backlog tasks can be decomposed into `spec_task` units for agent execution.

### Acceptance criteria
- Decomposition preserves dependency DAG integrity.
- Execution plans include rollback and verification hooks.
- Completion auto-updates backlog state only after acceptance evidence passes.

## SIVO-BACKLOG-005 External coexistence and migration

Sivo supports optional sync with external work tools during transition.

### Acceptance criteria
- Bi-directional adapter mappings are explicit and conflict-safe.
- Drift between Sivo and external tools is detectable and reportable.
- Sivo can be configured as authoritative backlog source.

## SIVO-BACKLOG-006 Product surfaces

Required surfaces:
- API endpoints for backlog entities and prioritization
- CLI commands for backlog operations
- dashboard views for planning, execution, and delivery risk

### Acceptance criteria
- API and CLI support bulk operations and machine-readable outputs.
- RBAC enforces who can reprioritize, approve, and close work.
- Dashboard shows queue health, cycle time, and blocked dependency clusters.
