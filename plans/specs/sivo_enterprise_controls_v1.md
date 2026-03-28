# Sivo Enterprise Controls v1

Version: `1.0.0`  
Status: Normative

## SIVO-ENT-001 Enterprise objective

Deliver enterprise-ready controls for identity, access, compliance, audit, and integrations without degrading deterministic SCM guarantees.

### Acceptance criteria
- Enterprise controls are available in API and CLI.
- Control failures are observable and auditable.
- Controls are enforceable per tenant/repository.

## SIVO-ENT-002 RBAC model

Canonical roles:
- `org_admin`
- `repo_admin`
- `developer`
- `reviewer`
- `agent_operator`
- `automation_service`
- `auditor`

### Acceptance criteria
- Role-to-action matrix is published and versioned.
- Least-privilege defaults are enforced for new roles/tokens.
- Privilege escalation requires explicit approval and audit evidence.

## SIVO-ENT-003 Identity and authn/authz

### Acceptance criteria
- Supports SSO/OIDC/SAML integration.
- Service tokens are scoped, expiring, and revocable.
- Every privileged action has actor identity and delegated authority trace.

## SIVO-ENT-004 Policy and compliance controls

### Acceptance criteria
- Policy bundles can be attached at org, team, and repo levels.
- Inheritance and override precedence are deterministic.
- Compliance mappings are available for SOC2/ISO27001/SLSA-aligned controls.
- Industry-standard enablement paths are documented for OPA-compatible policy bundles and SCIM provisioning.

## SIVO-ENT-005 Audit and legal controls

### Acceptance criteria
- Immutable audit logs are exportable with signature verification.
- Legal hold blocks retention-based deletion.
- Retention and residency policies are tenant-configurable and enforceable.

## SIVO-ENT-006 Integration adapters

Required integration categories:
- VCS hosts (GitHub/GitLab/Bitbucket)
- CI/CD (Actions, GitLab CI, Jenkins, Buildkite)
- Identity (Okta, Entra ID, generic OIDC/SAML)
- Observability/SIEM (Datadog, Splunk, Elastic, OpenTelemetry)
- Work tracking (Jira, Linear, ServiceNow)

### Acceptance criteria
- Adapter health and sync lag metrics are exposed.
- Adapter failures degrade gracefully and preserve core Sivo operations.
- Integration secrets are managed through secure credential stores.

## SIVO-ENT-007 Multi-tenancy and isolation

### Acceptance criteria
- Tenant isolation boundaries are validated by security tests.
- Cross-tenant access attempts are blocked and audited.
- Data-plane and control-plane tenancy boundaries are explicit.

## SIVO-ENT-008 Deployment mode support

Enterprise deployments MUST support customer-managed installs and managed SaaS.

### Acceptance criteria
- Customer-managed deployment guidance exists for private and public cloud.
- SaaS deployment model enforces tenant isolation similar to large hosted VCS platforms.
- Mode parity matrix defines which controls are guaranteed in each mode.
