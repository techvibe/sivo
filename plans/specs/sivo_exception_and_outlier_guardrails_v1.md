# Sivo Exception and Outlier Guardrails v1

Version: `1.0.0`  
Status: Normative

## SIVO-SAFE-001 Objective

Prevent autonomous agents from exiting guardrails under exception, outlier, ambiguous-intent, or adversarial conditions.

### Acceptance criteria
- All critical guardrail failures fail closed by default.
- Outlier detection and escalation are mandatory before continuing execution.
- Safety control status is visible in dashboard and release evidence.

## SIVO-SAFE-002 Failure-mode taxonomy

Mandatory tracked classes:
- policy bypass attempt
- prompt-injection or instruction-conflict event
- intent ambiguity or drift
- anomalous execution pattern (scope/time/cost/tooling)
- confidence-collapse or uncertainty spike
- dependency/deadlock anomalies

### Acceptance criteria
- Each class maps to deterministic remediation actions.
- Unknown failure classes are treated as blocking until triaged.
- Incident classification is stored as immutable evidence.

## SIVO-SAFE-003 Circuit breakers and fail-closed controls

### Acceptance criteria
- Circuit breakers pause mutation and promotion on critical anomalies.
- Breaker reset requires role-scoped approval and root-cause note.
- Breaker activation and reset are auditable events.

## SIVO-SAFE-004 Execution budgets and uncertainty controls

Required controls:
- runtime budget
- token/cost budget
- mutation scope budget
- uncertainty ceiling for autonomous decisions

### Acceptance criteria
- Budget breaches pause execution and trigger escalation.
- Uncertainty above threshold enforces human review.
- Budget and uncertainty thresholds are tenant-configurable within policy bounds.

## SIVO-SAFE-005 Prompt safety and steering conflict handling

### Acceptance criteria
- Prompt updates are checked for policy conflicts and intent contradictions.
- Contradictory steering prompts trigger clarification workflow.
- Untrusted prompt sources cannot override signed policy envelopes.

## SIVO-SAFE-006 Fallback and degraded modes

### Acceptance criteria
- Fallback modes are explicitly defined: `observe_only`, `human_approval_only`, `read_only_safe_mode`.
- Transition into and out of fallback modes is deterministic and auditable.
- Degraded mode behavior preserves lineage and evidence continuity.

## SIVO-SAFE-007 Verification and drills

### Acceptance criteria
- Fault-injection tests include outlier and adversarial scenarios.
- Kill-switch and rollback drills run on a defined cadence.
- Release is blocked if safety drill coverage falls below threshold.

## SIVO-SAFE-008 Advanced hardening controls

### Acceptance criteria
- Red-team corpus policy is enforced via `redteam_corpus_policy_v1.yaml`.
- Differential safety equivalence is enforced via `differential_safety_matrix_v1.yaml`.
- Canary and break-glass governance is enforced via `canary_and_breakglass_policy_v1.yaml`.
