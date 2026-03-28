# Sivo Migration Playbook v1

Version: `1.0.0`  
Status: Normative guidance

## SIVO-MIG-001 Migration objective

Enable safe, measurable migration from Git-centric workflows to Sivo-first workflows while preserving permanent dual-mode compatibility.

### Acceptance criteria
- Migration states are explicit and queryable.
- Rollback path exists for each migration phase.
- Migration quality gates are enforced before phase advancement.

## SIVO-MIG-002 Migration states

- `state_0_git_only`
- `state_1_observe` (Sivo ingest only)
- `state_2_dual_write` (Sivo + Git projection)
- `state_3_sivo_primary` (Git compatibility transport retained)
- `state_4_optimized_ai_native` (Git effectively invisible to most users)

### Acceptance criteria
- State transitions require passing predefined gates.
- State changes emit immutable migration events.
- Unsupported transitions are rejected with remediation guidance.

## SIVO-MIG-003 Readiness assessment

Inputs:
- repository complexity
- CI/CD topology
- policy/compliance profile
- agent adoption maturity

### Acceptance criteria
- Readiness score is computed from deterministic rubric.
- Blocking risks and required mitigations are listed per repo.
- Assessment output is dashboard-visible.

## SIVO-MIG-004 Execution checklist

- import and lineage validation
- dual-mode sync enablement
- policy and attestation activation
- post-quantum-hybrid crypto profile activation and verification
- benchmark baseline capture
- user/agent workflow cutover

### Acceptance criteria
- Checklist items map to task IDs and evidence bundles.
- Completion cannot be marked without acceptance evidence.
- Exceptions require signed waiver with expiry.

## SIVO-MIG-005 Coexistence and drift controls

### Acceptance criteria
- Drift checks run continuously in `state_2_dual_write` and above.
- Drift severity drives automated remediation recommendations.
- Persistent blocking drift pauses migration progression.

## SIVO-MIG-006 Change management and training

### Acceptance criteria
- Role-specific runbooks exist for developers, reviewers, and operators.
- Training completion and adoption telemetry are measurable.
- Support escalation pathways are documented.

## SIVO-MIG-007 Success criteria

### Acceptance criteria
- Migration phase success is linked to policy, conformance, and performance gates.
- No critical regression in release integrity during migration.
- Post-migration audits can reconstruct full lineage and decisions.

## SIVO-MIG-008 Deployment mode readiness

Migration and rollout MUST account for customer-managed and SaaS deployment models.

### Acceptance criteria
- Readiness assessment includes deployment mode constraints and tenancy requirements.
- Migration checklists include mode-specific install/upgrade/rollback validation.
- Mode transition paths preserve lineage and evidence integrity.
