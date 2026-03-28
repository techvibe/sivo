# Dual-Mode + Storage + Protocol Conformance Matrix v1

Version: `1.0.0`  
Status: Release-gating matrix

## Scope

This matrix binds requirements from:
- `sivo_protocol_v1.md`
- `sivo_storage_multifolder_v1.md`
- `sivo_git_dualmode_contract_v1.md`

## Conformance matrix

| Check ID | Spec section | Test type | Blocking |
|---|---|---|---|
| CONF-PROT-001 | SIVO-PROT-003 | Schema/API parity | Yes |
| CONF-PROT-002 | SIVO-PROT-004 | State machine transition checks | Yes |
| CONF-PROT-003 | SIVO-PROT-005 | Determinism replay fixtures | Yes |
| CONF-STOR-001 | SIVO-STOR-003 | Checkpoint replay equivalence | Yes |
| CONF-STOR-002 | SIVO-STOR-005 | Compaction semantic preservation | Yes |
| CONF-STOR-003 | SIVO-STOR-007 | Invariant validation | Yes |
| CONF-DUAL-001 | SIVO-DUAL-002 | Projection golden outputs | Yes |
| CONF-DUAL-002 | SIVO-DUAL-004 | Drift detection severity correctness | Yes |
| CONF-DUAL-003 | SIVO-DUAL-005 | Rewrite remap consistency | Yes |
| CONF-DUAL-004 | SIVO-DUAL-007 | Cross-host matrix | Yes |

## Release gate policy

- Any failed `Blocking=Yes` check blocks promotion and release.
- Flaky checks above threshold (`>2%` in trailing 7 days) block release until stabilized or waived.
- Waivers require signed approval from `release_owner` and expire in 14 days.

## Acceptance criteria

- Matrix is executed in CI for every release candidate.
- Every check emits evidence IDs for dashboard and audit exports.
- Matrix revision history is versioned and immutable after release cut.
