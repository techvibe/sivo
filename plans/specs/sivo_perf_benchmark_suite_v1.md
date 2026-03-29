# Sivo Performance Benchmark Suite v1

Version: `1.0.0`  
Status: Normative release gate

## SIVO-PERF-001 Objective

Prove and continuously enforce a 3-10x performance and scalability advantage for Sivo across Git-equivalent and AI-native workflow tracks.

### Acceptance criteria
- Benchmark harness is reproducible and versioned.
- Results include raw artifacts, environment metadata, and summary reports.
- Release pipeline blocks on gate violations.
- Canonical suite config is stored in `benchmark_suite_v1.yaml`.

## SIVO-PERF-002 Benchmark tracks

Track A (Git-equivalent):
- clone/sync/status/history/merge operations
- medium and large monorepo fixtures

Track B (AI-native):
- context retrieval latency
- multi-agent plan-to-change throughput
- semantic conflict detection and resolution latency
- policy/provenance verification latency and throughput

### Acceptance criteria
- Both tracks run in CI for release candidates.
- Fixture definitions are immutable and published.
- Any fixture changes require benchmark baseline recalibration workflow.

## SIVO-PERF-003 Metrics and thresholds

Primary metrics:
- latency (P50/P95/P99)
- throughput (ops/minute, tasks/hour)
- CPU/memory/IO cost
- token and model invocation cost (AI-native track)

Hard threshold:
- Sivo MUST be >= 3.0x faster on weighted composite score for each track.
Target band:
- Sivo SHOULD achieve 5.0-10.0x advantage on AI-native track.

### Acceptance criteria
- Composite score formula and weights are explicitly versioned.
- Confidence intervals are reported for each metric.
- Threshold breaches are automatically classified (`warning` or `blocking`).

## SIVO-PERF-004 Composite score formula

For each track:
- Normalize each metric against Git or baseline workflow.
- Apply weighted harmonic mean to favor weakest dimensions.
- Composite score = baseline_cost / sivo_cost (higher is better).

### Acceptance criteria
- Formula implementation is deterministic and test-covered.
- Score outputs are explainable per metric contribution.
- Historical score trend is queryable by version and fixture.

## SIVO-PERF-005 Release gating policy

Blocking conditions:
- track composite score < 3.0x
- P95 regression > 15% against previous stable release without approved waiver
- benchmark flakiness > accepted threshold

### Acceptance criteria
- Gate results are published to dashboard and release artifacts.
- Waivers require signed approval and expiry.
- Gate bypass attempts are audited.
- Canonical gate policy is stored in `benchmark_gate_policy_v1.yaml`.

## SIVO-PERF-006 Scalability validation

### Acceptance criteria
- Scale tests include repository size, file count, and branch fan-out growth scenarios.
- Memory index build/update time remains within defined SLOs.
- Multi-tenant load tests include noisy-neighbor isolation checks.

## SIVO-PERF-007 Fixture-backed benchmark gate determinism

Performance release gate decisions MUST be validated with canonical benchmark fixtures.

### Acceptance criteria
- Track A fixtures are maintained in `fixtures/perf_track_a_fixtures_v1.yaml`.
- Track B fixtures are maintained in `fixtures/perf_track_b_fixtures_v1.yaml`.
- Fixture suites include passing and blocking/warning scenarios with deterministic gate outcomes.
