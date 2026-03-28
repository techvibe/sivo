# Sivo Git Compatibility Profile v1

## Goal

Define the minimum contract that allows Sivo to act as a Git replacement path while preserving interoperability with existing Git hosts and workflows.

## Guarantees

- Deterministic projection from sealed Sivo session to Git tree/commit graph.
- Host-agnostic push/pull compatibility (GitHub, GitLab, Bitbucket, self-hosted Git).
- No hidden lock-in: exported Git history remains valid outside Sivo.
- Stable round-trip behavior for supported metadata fields.

## Projection contract

- One sealed Sivo session maps to one or more Git commits.
- Commit ordering is deterministic from event order plus merge policy.
- Commit message includes stable Sivo session reference.
- Additional Sivo metadata is encoded in trailers and/or sidecar refs.

## Import contract

- Git commits can be ingested into Sivo as session-derived lineage.
- Unknown Git metadata is preserved best-effort.
- Missing semantic metadata is represented as file-level deltas with explicit downgrade flags.

## Refs and metadata

- Standard refs (`refs/heads/*`, `refs/tags/*`) remain Git-compatible.
- Sivo metadata uses reserved namespace (example: `refs/sivo/*`).
- Reserved namespace must never alter host-visible branch semantics.

## Round-trip profiles

- `strict`: exact metadata-preserving round-trip in supported feature set.
- `graceful`: preserves content and topology, may degrade unsupported semantic metadata with explicit notices.

## Failure and fallback policy

- If semantic projection fails, fallback to file-level deterministic projection.
- If signing infrastructure is unavailable, block release-class seals but allow local draft sessions with clear status.
- Projection failures must produce machine-readable diagnostics for agent remediation.

## Test and conformance

- Golden tests for deterministic projection outputs.
- Cross-host push/pull conformance matrix.
- Import-then-export round-trip tests across common Git workflow patterns.
- Compatibility CI gates must run on every protocol version change.
