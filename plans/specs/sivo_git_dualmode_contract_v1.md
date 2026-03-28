# Sivo Git Dual-Mode Contract v1

Version: `1.0.0`  
Status: Normative

## SIVO-DUAL-001 Dual-mode posture

Sivo MUST permanently support Git coexistence while preserving Sivo-first semantics.

### Acceptance criteria
- Dual-mode can be enabled per repository/tenant with explicit policy.
- Sivo-originated workflows run without direct Git user interaction.
- Git projection remains available for all sealed sessions.

## SIVO-DUAL-002 Projection mapping

Projection requirements:
- deterministic commit ordering
- stable session references in commit metadata
- reserved refs for Sivo metadata (`refs/sivo/*`)
- explicit downgrade markers when semantic fidelity degrades

### Acceptance criteria
- Same sealed session produces identical projected commit graph.
- Mapping spec includes field-level handling for messages, trailers, refs, and sidecars.
- Projection outputs pass golden snapshot tests.

## SIVO-DUAL-003 Import and reconcile

Git-originated changes can be imported as Sivo lineage with compatibility profile tags.

### Acceptance criteria
- Import path preserves Git topology and relevant metadata.
- Unknown metadata is retained best-effort with diagnostics.
- Reconcile flow creates machine-readable drift records.

## SIVO-DUAL-004 Dual-write and drift policy

When dual-write is enabled, Sivo and Git states are synchronized under deterministic conflict rules.

### Acceptance criteria
- Drift detection runs on every sync cycle.
- Drift severity is classified (`info`, `warning`, `blocking`).
- Blocking drift prevents release promotion until resolved or policy-exempted.

## SIVO-DUAL-005 Rewrite and force-update handling

Git history rewrites and force pushes must not silently invalidate Sivo lineage.

### Acceptance criteria
- Rewrite detection emits immutable audit events.
- Projection lineage references survive rewrites via remap manifests.
- Policy can enforce freeze-on-rewrite for protected branches.

## SIVO-DUAL-006 Failure/fallback behavior

- If semantic projection fails, fallback to deterministic file-level projection.
- If remote Git is unavailable, sealed Sivo sessions remain valid locally with deferred export.

### Acceptance criteria
- Fallback path is deterministic and explicitly marked.
- Deferred export queue is persistent and replay-safe.
- Operators receive remediation diagnostics with actionable codes.

## SIVO-DUAL-007 Conformance suite

The dual-mode suite MUST validate:
- cross-host compatibility (GitHub, GitLab, Bitbucket, self-hosted)
- strict and graceful round-trip profiles
- rewrite/rebase/squash edge cases

### Acceptance criteria
- Suite runs on every protocol/storage release candidate.
- Any deterministic mismatch is release-blocking.
- Public compatibility report is generated for each release.
