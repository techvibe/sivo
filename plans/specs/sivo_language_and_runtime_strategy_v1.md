# Sivo Language and Runtime Strategy v1

Version: `1.0.0`  
Status: Normative

## SIVO-LANG-001 Primary implementation language decision

Sivo primary implementation language is **Rust**.

Rationale:
- high performance and predictable latency for SCM/storage/verification hot paths
- strong memory safety guarantees for long-lived enterprise services
- mature async/networking ecosystem for secure service-to-service connectivity
- broad adoption and growing enterprise acceptance for systems software

### Acceptance criteria
- Core protocol, storage, seal/attestation, and verification engines are implemented in Rust.
- Performance-critical paths avoid language boundary overhead in hot loops.
- Security-critical components use Rust-safe abstractions and audited dependencies.

## SIVO-LANG-002 Polyglot access strategy

Sivo must remain language-ubiquitous through stable network contracts and SDKs.

### Acceptance criteria
- Canonical service surface is exposed via OpenAPI + gRPC/Connect-compatible APIs.
- Official SDKs are maintained for at least: TypeScript/JavaScript, Python, Go, Java, and .NET.
- CLI and MCP adapters are first-class and versioned with protocol releases.

## SIVO-LANG-003 AI model/provider connectivity

Sivo must support many model classes (frontier APIs, small models, and local models) via provider-neutral adapters.

### Acceptance criteria
- Model adapter contract is provider-neutral and schema-versioned.
- Local model runtimes and remote model APIs can be configured per tenant policy.
- Model-provider differences cannot alter correctness semantics for policy or merge outcomes.

## SIVO-LANG-004 Enterprise identity and access ubiquity

Connectivity and access controls must integrate with existing enterprise identity systems in industry-standard ways.

### Acceptance criteria
- OIDC, SAML, SCIM, and standard JWT/OAuth2 token flows are supported.
- Service-to-service auth supports mTLS and policy-scoped service identities.
- Tenant policies can enforce allowed identity providers and auth modes.

## SIVO-LANG-005 Secure transport baseline

All connectivity to Sivo must be secure by default and compatible with enterprise network controls.

### Acceptance criteria
- TLS is mandatory for network interfaces with configurable strict profiles.
- Post-quantum-hybrid transport profile support is available for protected environments.
- Downgrade attempts and insecure transport configuration are blocking by policy.

## SIVO-LANG-006 Delivery model for OSS and enterprise

### Acceptance criteria
- OSS distribution provides reproducible Rust builds, verifiable artifacts, and SDK clients.
- Enterprise distribution adds hardened deployment packs, compliance controls, and support SLAs.
- SaaS and self-hosted editions share the same protocol and verification contracts.

## SIVO-LANG-007 Fixture-backed parity and identity conformance

Language/runtime parity and enterprise identity controls MUST be validated via canonical fixtures.

### Acceptance criteria
- SDK parity fixtures are maintained in `fixtures/sdk_parity_fixtures_v1.yaml`.
- Enterprise identity integration fixtures are maintained in `fixtures/identity_integration_fixtures_v1.yaml`.
- Each fixture suite includes passing and blocking scenarios with deterministic expected outcomes.
