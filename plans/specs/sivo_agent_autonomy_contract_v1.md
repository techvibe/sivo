# Sivo Agent Autonomy Contract v1

Version: `1.0.0`  
Status: Normative

## SIVO-AGENT-001 Objective

Define how Cursor and multi-agent systems execute autonomous implementation tasks safely, deterministically, and traceably against Sivo specs.

### Acceptance criteria
- Agent task execution is policy-gated before mutation.
- Every autonomous step emits traceable, machine-readable events.
- Rollback and safe-stop behavior is implemented and testable.

## SIVO-AGENT-002 Task contract

All autonomous tasks MUST conform to `spec_task.schema.yaml`.

Required task fields:
- `task_id`
- `spec_section_ids`
- `objective`
- `scope`
- `policy_envelope`
- `acceptance_tests`
- `observability`
- `rollback_strategy`
- `dependencies`

### Acceptance criteria
- Task definitions failing schema validation are rejected.
- `spec_section_ids` map to existing canonical spec sections.
- Unresolved dependencies prevent task scheduling.

## SIVO-AGENT-003 Policy envelope

Every task defines:
- allowed paths/resources
- prohibited operations
- required approvals
- required checks

### Acceptance criteria
- Policy preflight runs before execution starts.
- Policy violations produce blocking outcomes with remediation hints.
- Emergency overrides require explicit privileged approvals and audit trail.

## SIVO-AGENT-004 Execution and checkpoints

Agents execute task steps with deterministic checkpoint logs.

### Acceptance criteria
- Checkpoints include `step_id`, `input_refs`, `output_refs`, `decision_ref`.
- Failed steps can be resumed from last checkpoint if policy allows.
- Non-retryable failures trigger safe-stop and escalation workflow.

## SIVO-AGENT-005 Evidence and completeness emission

Agents MUST emit evidence and progress records consumable by completeness dashboards.

### Acceptance criteria
- Each task emits percent-complete and confidence score updates.
- Completion requires verified acceptance test evidence references.
- Dashboard ingestion validates schema and rejects malformed reports.

## SIVO-AGENT-006 Multi-agent coordination

### Acceptance criteria
- Claim conflict resolution exists for overlapping scopes.
- Leader/follower orchestration mode is defined and enforceable.
- Deadlock detection and remediation are covered by integration tests.

## SIVO-AGENT-007 Human-in-the-loop controls

### Acceptance criteria
- Task classes can require human approval gates.
- Approvals are role-scoped and signed.
- Rejections trigger deterministic rollback or alternate-plan routing.

## SIVO-AGENT-008 Execution guarantees and verification dependency

Autonomous build tasks MUST run under verify-first stage gates and emit release-grade evidence.

### Acceptance criteria
- Agent orchestration integrates with stage order defined in `verification_gate_policy_v1.yaml`.
- Tasks cannot transition to `completed` unless required verification artifacts are attached.
- Agent pipeline blocks downstream tasks when upstream critical checks fail.

## SIVO-AGENT-009 Intent-driven and BDD execution requirements

Autonomous tasks MUST include explicit intent contracts and executable BDD scenarios.

### Acceptance criteria
- Task schemas require `intent_contract` and `bdd_scenarios`.
- Execution preflight validates intent completeness and scenario test mappings.
- Intent drift during execution pauses the task and requires steering re-approval.

## SIVO-AGENT-010 Exception and outlier fail-safe behavior

Agents MUST enforce fail-closed behavior under critical anomalies and uncertainty breaches.

### Acceptance criteria
- Runtime uses `execution_safety_profile_v1.yaml` as canonical safety control source.
- Circuit breaker activation pauses mutation and promotion paths.
- Breaker reset requires signed approval from authorized roles.
- Fallback modes preserve audit and lineage continuity.

## SIVO-AGENT-011 Adversarial and rollout hardening requirements

### Acceptance criteria
- Agents cannot mark safety-sensitive tasks complete without red-team and differential safety evidence.
- Safety-sensitive changes require canary rollout evidence before general rollout status.
- Break-glass usage always creates remediation backlog tasks before closure.
