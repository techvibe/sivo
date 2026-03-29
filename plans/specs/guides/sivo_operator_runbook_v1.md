# Sivo Operator Runbook v1

## Who this guide is for

SRE and operations teams running Sivo control and data plane services.

## Daily operations

- Check service health by component.
- Review event ingestion lag and error rate.
- Review drift, policy-block, and benchmark-block alerts.
- Verify backup jobs and checkpoint integrity.

## Incident classes

- `sev1_data_integrity`: hash chain or replay invariant violations
- `sev1_policy_bypass`: unauthorized mutation or guardrail bypass
- `sev2_projection_drift`: persistent dual-mode drift
- `sev2_perf_regression`: benchmark gate failures

## Immediate response playbooks

- Data integrity: isolate affected streams, halt promote, run recovery validation.
- Policy bypass: revoke affected tokens, freeze privileged actions, audit trace chain.
- Drift: stop release promotion for affected repos, run reconcile diagnostics.
- Performance: block release and run regression analysis fixture set.

## Backup and recovery

- Verify RPO/RTO against configured targets.
- Run monthly restore drills from snapshots + event tails.
- Validate restored state with conformance fixtures.

## Observability requirements

- Emit trace IDs for every critical operation.
- Retain metrics and logs per compliance policy.
- Export signed incident reports with evidence references.

## Verification coverage fixture mapping

- Critical workflow fixture ID: `docs-critical-path-complete`
- Fixture source: `plans/specs/fixtures/docs_workflow_fixtures_v1.yaml`
