# Sivo Post-Quantum Cryptography v1

Version: `1.0.0`  
Status: Normative

## SIVO-PQ-001 Objective

Ensure Sivo cryptographic integrity remains secure against both classical and post-quantum adversaries through crypto-agile, hybrid-first controls.

### Acceptance criteria
- All security-critical signatures and transport channels support approved hybrid classical+post-quantum options.
- Sivo can rotate cryptographic suites without breaking determinism or replay.
- Post-quantum readiness status is visible in release evidence and enterprise dashboards.

## SIVO-PQ-002 Crypto-agility and suite negotiation

Sivo MUST support explicit cryptographic suite negotiation and versioned policy selection.

### Acceptance criteria
- Every signed artifact records the exact cryptographic suite identifier.
- Unsupported suites fail closed with deterministic diagnostics.
- Suite deprecation and migration windows are policy-controlled and auditable.
- Canonical suite policy is defined in `post_quantum_crypto_profile_v1.yaml`.

## SIVO-PQ-003 Hybrid signatures for seals and attestations

Sivo seal and attestation signatures MUST use hybrid signature profiles for production-grade operations.

### Acceptance criteria
- Release-class seals require one approved classical signature and one approved post-quantum signature.
- Verification succeeds only when required components of the selected profile validate.
- Local draft sessions may use reduced profiles only when policy explicitly permits.

## SIVO-PQ-004 Hybrid key establishment and transport

Inter-service and client/server channels MUST support hybrid key establishment for high-assurance deployments.

### Acceptance criteria
- TLS/key-establishment profiles include approved post-quantum-capable options.
- Tenant/operator policy can enforce PQ-hybrid-only transport modes.
- Downgrade attempts are detected and logged as security events.

## SIVO-PQ-005 Key management and lifecycle

### Acceptance criteria
- Key generation, storage, rotation, and revocation support both classical and PQ key material.
- Hardware-backed key stores (KMS/HSM where available) support configured profiles or equivalent protections.
- Compromised or deprecated suite states are replay-verifiable and promotion-blocking when required.

## SIVO-PQ-006 Determinism and compatibility constraints

### Acceptance criteria
- Deterministic projection and replay remain stable regardless of approved cryptographic suite choice.
- Git dual-mode metadata preserves suite IDs and verification outcomes.
- Mixed-era archives (pre-PQ and PQ-hybrid) remain verifiable through compatibility profiles.

## SIVO-PQ-007 Verification and compliance

### Acceptance criteria
- Post-quantum conformance tests run in release pipelines.
- Crypto agility drills (suite rotation, revocation, fallback) run on a defined cadence.
- Release blocks on failed PQ conformance for protected environments.

## SIVO-PQ-008 Fixture-backed conformance determinism

Post-quantum policy enforcement and rotation behavior MUST be validated using canonical fixtures.

### Acceptance criteria
- Hybrid signature fixture suite is maintained in `fixtures/pq_signature_fixtures_v1.yaml`.
- Crypto rotation fixture suite is maintained in `fixtures/crypto_rotation_fixtures_v1.yaml`.
- Hybrid transport downgrade fixture suite is maintained in `fixtures/pq_transport_downgrade_fixtures_v1.yaml`.
- Each fixture suite includes both passing and blocking scenarios with deterministic expected outcomes.
