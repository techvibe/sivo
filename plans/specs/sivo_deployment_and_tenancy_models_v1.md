# Sivo Deployment and Tenancy Models v1

Version: `1.0.0`  
Status: Normative

## SIVO-DEPLOY-001 Objective

Support enterprise deployment on customer infrastructure (private/public cloud) and managed SaaS deployment with strong tenant isolation.

### Acceptance criteria
- Self-hosted and SaaS topologies are first-class supported modes.
- Deployment mode selection is policy-governed and auditable.
- Mode-specific constraints are validated before go-live.

## SIVO-DEPLOY-002 Self-hosted deployment models

Supported self-hosted models:
- single-tenant private cloud
- single-tenant public cloud
- hybrid control/data plane split

### Acceptance criteria
- Installation guides include reference architectures and hardening defaults.
- Upgrade, backup, restore, and rollback procedures are documented and tested.
- Air-gapped and restricted-network operation is documented where supported.

## SIVO-DEPLOY-003 Managed SaaS model

### Acceptance criteria
- Tenant onboarding and isolation controls are automated.
- Control-plane and data-plane tenancy boundaries are independently enforced.
- Noisy-neighbor protections and quota controls are measurable.

## SIVO-DEPLOY-004 Tenancy and isolation guarantees

Required guarantees:
- strict tenant data isolation
- tenant-scoped encryption and key-management boundaries
- tenant-scoped policy and audit domains

### Acceptance criteria
- Isolation tests include cross-tenant read/write and side-channel checks.
- Key and secret access is tenant-scoped and auditable.
- Isolation regressions are release-blocking.

## SIVO-DEPLOY-005 Enterprise enablement baseline

### Acceptance criteria
- Standard integrations for identity, SIEM, and CI/CD are available in both modes.
- Compliance and residency controls are configurable per tenant.
- Performance SLOs are published for self-hosted and SaaS profiles.
- Post-quantum-hybrid cryptographic profiles are supported in both self-hosted and SaaS modes.

## SIVO-DEPLOY-006 Mode migration and coexistence

### Acceptance criteria
- Migration paths across deployment modes are documented.
- Data portability and import/export guarantees are test-backed.
- Migration tooling preserves lineage, policy, and evidence integrity.
