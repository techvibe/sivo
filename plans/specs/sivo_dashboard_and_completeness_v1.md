# Sivo Dashboard and Completeness Contract v1

Version: `1.0.0`  
Status: Normative

## SIVO-DASH-001 Dashboard objective

Provide real-time, auditable visibility into implementation progress, product completeness, policy posture, and operational health.

### Acceptance criteria
- Dashboard data model is versioned and machine-readable.
- Engineering and enterprise views can be generated from same canonical event stream.
- Data freshness SLO is defined and monitored.

## SIVO-DASH-002 Dashboard planes

- Engineering dashboard (build and conformance)
- Enterprise customer dashboard (usage, policy, trust, migration)

### Acceptance criteria
- Views are role-scoped using RBAC.
- Sensitive fields are masked according to policy.
- Drill-down links map to canonical trace and evidence IDs.

## SIVO-DASH-003 Completeness model

Completeness score (`0.0` to `1.0`) is weighted by:
- spec section implementation status
- acceptance test pass ratio
- conformance coverage
- benchmark gate status
- docs and guide coverage
- unresolved risk/blocker penalties

### Acceptance criteria
- Score formula and weights are versioned.
- Score recomputation is deterministic for same inputs.
- Manual overrides are prohibited or fully audited by policy.
- Canonical formula is stored in `completeness_formula_v1.yaml`.

## SIVO-DASH-004 Canonical metrics

Engineering metrics:
- spec coverage by module
- task throughput and lead time
- conformance pass/fail and flake rate
- benchmark delta vs target
- open severity-1 blockers
- intent coverage ratio and intent drift incidents
- BDD scenario pass ratio on critical paths
- ADR coverage and ADR evidence freshness
- production quality SLO compliance ratio
- critical customer journey pass rate
- guardrail breach rate and circuit breaker activation rate
- uncertainty breach count and budget breach count
- red-team corpus pass rate and critical-case failure count
- differential safety mismatch rate across model providers
- canary safety regression rate and break-glass invocation count

Enterprise metrics:
- policy compliance coverage
- provenance completeness
- RBAC drift alerts
- migration status by repository
- dual-mode health and drift trend
- backlog queue health and dependency risk
- learning recommendation adoption and rollback rate

### Acceptance criteria
- Each metric has source, formula, and update cadence.
- Missing data is explicitly represented, not silently ignored.
- Metric definitions are testable via fixture-based checks.

## SIVO-DASH-005 Data contract

Canonical events:
- `task_status_changed`
- `acceptance_result_recorded`
- `conformance_result_recorded`
- `benchmark_result_recorded`
- `policy_verdict_recorded`
- `migration_state_changed`

### Acceptance criteria
- Event schemas include `event_id`, `timestamp`, `tenant_id`, `repo_id`, `trace_id`.
- Event ingestion is idempotent.
- Late-arriving events are handled deterministically.
- `conformance_result_recorded` and `acceptance_result_recorded` events MUST carry `payload.metrics_snapshot.intent_contract_coverage` and `payload.metrics_snapshot.bdd_coverage_ratio`.
- Canonical event schema is stored in `dashboard_data_contract_v1.json`.

## SIVO-DASH-006 Alerting and blockers

### Acceptance criteria
- Release blockers are computed automatically from policy/conformance/benchmark failures.
- Alerts support threshold and anomaly modes.
- Escalation routes are configurable by tenant/org.

## SIVO-DASH-007 API and export

### Acceptance criteria
- Dashboard APIs support filtered queries and signed exports.
- Exports are available in JSON and CSV with schema version tags.
- Audit export includes completeness history and source evidence links.
