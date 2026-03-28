# Sivo Multifolder Storage v1

Version: `1.0.0`  
Status: Normative

## SIVO-STOR-001 Storage objective

Storage MUST outperform Git-centric workflows for AI-native use cases while preserving deterministic projection to Git.

### Acceptance criteria
- Storage layout and access paths are documented and benchmarked.
- Projection to Git is loss-bounded under dual-mode policy.
- Storage corruption detection exists with repair guidance.

## SIVO-STOR-002 Repository layout

Canonical multifolder layout (logical):

- `.sivo/events/` append-only event segments and checkpoints
- `.sivo/objects/` content-addressed blobs and trees
- `.sivo/semantic/` indexes, symbol graphs, embeddings metadata
- `.sivo/policy/` policy snapshots and evaluation traces
- `.sivo/attestations/` signed provenance bundles
- `.sivo/memory/` normalized memory entries and retrieval indexes
- `.sivo/projection/git/` dual-mode mapping metadata and drift records

### Acceptance criteria
- Layout supports partial reads and selective hydration.
- Folders can be independently compacted without violating replay.
- All folders are covered by integrity checksums.

## SIVO-STOR-003 Event log and checkpoints

Event segments are immutable once sealed. Checkpoints summarize deterministic state to accelerate replay.

### Acceptance criteria
- Replay from checkpoint + tail segments reconstructs canonical state.
- Checkpoint generation is deterministic for same event range.
- Corrupted segments are quarantined and surfaced to operators.

## SIVO-STOR-004 Semantic and memory indexing

Semantic and memory indexes MUST be incrementally maintained and versioned by parser/model adapters.

### Acceptance criteria
- Index updates are incremental per changed entities.
- Index schema versions are explicit and backward-compatible for reads.
- Index rebuild procedure exists with bounded downtime targets.

## SIVO-STOR-005 Compaction and snapshotting

Compaction merges historical segments and prunes superseded transient artifacts while preserving auditability.

### Acceptance criteria
- Compaction never changes effective replay semantics.
- Snapshot restore is validated against conformance fixtures.
- Compaction policy is configurable by repo size and retention profile.

## SIVO-STOR-006 Scale and partition behavior

Storage MUST support monorepo scale and partition-tolerant local work.

### Acceptance criteria
- Local mode supports offline event append and deferred sync.
- Reconnect reconciliation is deterministic and conflict-reported.
- Multi-region replication lag and backlog metrics are exposed.

## SIVO-STOR-007 Conformance invariants

- Event sequence numbers are monotonic per stream.
- Hash chain continuity cannot be skipped.
- Projection mapping references must resolve to immutable event/state IDs.

### Acceptance criteria
- Invariants are validated by automated storage conformance tests.
- Any invariant violation blocks promotion operations.
- Dashboard surfaces invariant health per repository.
