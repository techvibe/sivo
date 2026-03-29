# Sivo Protocol v1

Version: `1.0.0`  
Status: Normative

## SIVO-PROT-001 Protocol scope

The protocol defines model-agnostic SCM operations for AI and human actors, with deterministic outcomes and replayable provenance.

### Acceptance criteria
- A complete operation set is published with request/response schemas.
- Protocol behavior does not vary by model vendor.
- Compatibility notes exist for all v0-to-v1 deltas.

## SIVO-PROT-002 Canonical objects

- `session`
- `claim`
- `delta`
- `validation`
- `seal`
- `projection`
- `attestation`
- `memory_entry`

### Acceptance criteria
- Each object has a canonical schema with required fields and semantic constraints.
- Object validation errors are machine-readable and stable.
- Backward-compatible parsing is supported for additive fields.

## SIVO-PROT-003 Required operations

- `create_session(plan_context, actor_context) -> session_id`
- `claim_scope(session_id, claim_spec) -> claim_result`
- `apply_delta(session_id, delta) -> delta_result`
- `run_validation(session_id, validation_spec) -> validation_result`
- `check_conflicts(session_id) -> conflict_matrix`
- `seal(session_id, seal_metadata) -> signed_bundle`
- `project(session_id, target="sivo|git") -> projection_ref`
- `push(projection_ref, remote_spec) -> push_result`
- `query_history(query_spec) -> lineage_slice`
- `query_memory(memory_query) -> memory_slice`

### Acceptance criteria
- All operations are exposed over API, CLI, and MCP adapters.
- Idempotency keys are supported for create/project/push operations.
- Standardized retryability metadata is returned on failures.

## SIVO-PROT-004 State machine and invariants

Valid state transitions:
- `draft -> claimed -> mutated -> validated -> sealed -> promoted`

Invariants:
- no seal without successful required validations
- no promote without valid signature bundle
- no mutation outside authorized claim scope unless policy permits emergency override

### Acceptance criteria
- Illegal transitions are rejected with deterministic error codes.
- Invariants are enforced in unit tests and conformance tests.
- Override events require explicit policy and actor authorization evidence.

## SIVO-PROT-005 Determinism contract

Given:
- same input event stream
- same policy version
- same merge strategy version

Then:
- terminal repository state MUST be identical byte-for-byte
- projection output identifiers MUST be stable

### Acceptance criteria
- Determinism replay tests run in CI on golden fixtures.
- Non-determinism incidents are release-blocking.
- Determinism proof artifacts are published per release.

## SIVO-PROT-006 Security and signatures

Every `seal` MUST include:
- hash-chain anchor
- actor identity and role
- signature(s) and verification method metadata

### Acceptance criteria
- Signature verification is mandatory during replay.
- Unsupported signature suites are rejected with actionable errors.
- Key rotation and revocation states are respected in verification.
- Production seal/attestation signatures support post-quantum-hybrid profiles per `post_quantum_crypto_profile_v1.yaml`.
- Signed artifacts include cryptographic suite IDs for long-term verification.

## SIVO-PROT-007 MCP and interoperability

MCP tool names MUST map 1:1 to protocol operations with stable naming and versioned schemas.

### Acceptance criteria
- MCP compatibility tests validate parity with direct API calls.
- Error code mappings are documented.
- Tool outputs include trace IDs and session IDs for audit linking.

## SIVO-PROT-008 Versioning policy

- Protocol uses semver.
- Breaking changes require major versions and migration artifacts.
- Additive fields are minor-version compatible.

### Acceptance criteria
- Version negotiation is explicit in clients and server.
- Migration notes are generated for every non-patch release.
- Conformance suite includes mixed-version compatibility tests.

## SIVO-PROT-009 Fixture-backed determinism and conformance

Protocol schema and replay guarantees MUST be validated against canonical fixtures.

### Acceptance criteria
- Canonical fixtures are maintained in `fixtures/protocol_golden_fixtures_v1.yaml`.
- Fixture suite includes both deterministic-pass and non-determinism-blocking scenarios.
- Release is blocked when fixture replay outcomes diverge from deterministic expectations.
