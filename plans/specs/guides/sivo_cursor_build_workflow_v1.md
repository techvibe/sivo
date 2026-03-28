# Sivo Cursor Build Workflow v1

## Goal

Define the exact loop Cursor agents follow to build Sivo from foundation to final OSS + enterprise state under deterministic guardrails.

## Workflow phases

1. Ingest steering prompt and normalize to intent update.
2. Validate intent, BDD, ADR, and safety requirements.
3. Re-prioritize backlog DAG and pick next unblocked critical task.
4. Execute task in scoped policy envelope with checkpoints.
5. Run staged verification gates (spec -> security/conformance -> e2e -> perf/resilience -> release decision).
6. Publish evidence and dashboard metrics.
7. If blocked, auto-escalate with remediation tasks; if passed, promote and continue.

## Dual-track delivery model

- OSS track: protocol, storage, CLI/API core, docs, conformance harness.
- Enterprise track: tenancy, RBAC/compliance, deployment modes, integrations, dashboards.
- Both tracks share one evidence and verification backbone.

## Non-linear steering behavior

- New prompts are converted into signed steering updates.
- Dependency graph and priorities are recalculated.
- Running tasks pause if intent/safety contradiction is detected.

## Completion criteria

- Critical spec sections implemented or explicitly deferred with approved risk.
- Required gate artifacts generated and signed.
- No unresolved blocking safety, quality, or tenancy issues.
- Performance thresholds and customer journey thresholds pass.
