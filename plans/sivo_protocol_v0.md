# Sivo Protocol v0 (AI-native, multi-model)

## Intent

Sivo protocol defines an AI-native SCM substrate for code, chat, voice, and other artifacts. It is designed to be model/provider-neutral and deterministic, while remaining compatible with Git through a strict projection profile.

## Principles

- Multi-model by design: no provider-specific correctness semantics.
- Deterministic state transition: same events produce same repository state.
- Event-first provenance: every mutation is attributable and replayable.
- Coordination-first concurrency: claims and conflict matrix before edits.
- Interoperable by default: Git import/export as a first-class path.

## Core objects

- `session`: bounded unit of coordinated work.
- `claim`: declared edit scope over entities/files/modules.
- `delta`: structured mutation payload (file-level or semantic-level).
- `seal`: signed closure event for a session.
- `projection`: deterministic output state, including Git representation.

## Required operations

- `create_session(plan_context, actor_context) -> session_id`
- `claim_scope(session_id, claim_spec) -> claim_result`
- `apply_delta(session_id, delta) -> delta_result`
- `check_conflicts(session_id) -> conflict_matrix`
- `seal(session_id, seal_metadata) -> signed_bundle`
- `project(session_id, target="git|sivo") -> projection_ref`
- `push(projection_ref, remote_spec) -> push_result`
- `query_history(query_spec) -> lineage_slice`

## Multi-model execution contract

- Agents from different model families can participate in one session.
- All agent outputs are normalized into protocol `delta` and `event` schema.
- Model metadata is captured for provenance but cannot alter merge correctness.
- Policy gates evaluate normalized events, not provider-specific traces.

## MCP mapping (reference)

- Expose all required operations as MCP tools with stable names.
- MCP server must return structured errors with retryability hints.
- Session operations must be idempotent where practical (`create_session`, `project`, `push` with request IDs).

## Compatibility policy

- Protocol follows semver.
- `v0.x` may evolve quickly but must preserve documented operations.
- Before `v1.0`, publish migration notes for every incompatible change.
- From `v1.0`, breaking changes require major versions and long deprecation windows.

## Security and provenance requirements

- Every `seal` includes cryptographic signature and event hash chain anchor.
- Actor identity is explicit (human, agent, orchestration service).
- Policy decisions and approval events are linked to session seal.
- Replay must verify tamper-evidence before reconstructing state.

## Git compatibility requirement

- Git projection is mandatory in all compliant Sivo deployments.
- Projection must be deterministic for the same sealed session.
- Importing Git history must preserve references necessary for later round-trip.
- See `sivo_git_compatibility_profile.md` for full constraints.
