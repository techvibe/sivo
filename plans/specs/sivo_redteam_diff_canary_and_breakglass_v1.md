# Sivo Red-Team, Differential Safety, Canary, and Break-Glass v1

Version: `1.0.0`  
Status: Normative

## SIVO-HARDEN-001 Objective

Continuously validate guardrails against adversarial behavior and prevent unsafe rollout drift through differential testing, canary release controls, and break-glass governance.

### Acceptance criteria
- Adversarial evaluation is mandatory on release candidates.
- Cross-model differential safety checks are mandatory before broad rollout.
- Canary rollout policies are enforced for safety-sensitive changes.
- Break-glass actions are tightly scoped, expiring, and fully audited.

## SIVO-HARDEN-002 Adversarial red-team corpus

### Acceptance criteria
- A versioned corpus of adversarial prompts and workflow perturbations is maintained.
- Corpus includes prompt-injection, instruction-conflict, privilege-escalation, and ambiguity scenarios.
- Release candidates must pass minimum corpus pass-rate threshold.

## SIVO-HARDEN-003 Differential safety testing

### Acceptance criteria
- Equivalent safety outcomes are tested across at least two model/provider families.
- Differential mismatch rates are measured and threshold-gated.
- Mismatch above threshold is release-blocking for safety-sensitive paths.

## SIVO-HARDEN-004 Canary rollout safety

### Acceptance criteria
- Safety-profile and learning-policy changes roll out via staged canaries.
- Canary stages define explicit halt/rollback thresholds.
- Automatic rollback triggers on safety regression signals.

## SIVO-HARDEN-005 Break-glass governance

### Acceptance criteria
- Break-glass paths are defined only for emergency continuity.
- Every break-glass action requires signed dual approval and expiry.
- Post-incident review and remediation tasks are mandatory before closure.

## SIVO-HARDEN-006 Evidence and dashboard visibility

### Acceptance criteria
- Red-team, differential, canary, and break-glass results are exported as signed artifacts.
- Dashboard shows trend lines and blocker status for each hardening dimension.
- Evidence is queryable by release version, task ID, and tenant scope.

## SIVO-HARDEN-007 Fixture-backed gate determinism

Release-gate decisions for hardening controls MUST be validated with canonical fixtures to ensure deterministic pass/block outcomes.

### Acceptance criteria
- Red-team gate fixture suite is maintained in `fixtures/redteam_corpus_fixtures_v1.yaml`.
- Differential safety gate fixture suite is maintained in `fixtures/differential_safety_fixtures_v1.yaml`.
- Canary and break-glass governance fixture suite is maintained in `fixtures/canary_governance_fixtures_v1.yaml`.
- Each fixture suite contains both pass and blocking scenarios with explicit expected gate decisions.
