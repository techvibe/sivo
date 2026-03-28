# Sivo Admin Guide v1

## Who this guide is for

Platform administrators responsible for policy, RBAC, integrations, and tenant governance.

## Initial setup checklist

- Configure identity provider (OIDC/SAML).
- Define RBAC role mappings and least-privilege defaults.
- Configure guardrail profiles and approval thresholds.
- Enable integration adapters (Git host, CI/CD, SIEM, work tools if needed).
- Configure retention, residency, and legal hold defaults.
- Select deployment mode (self-hosted private/public cloud or managed SaaS) and apply mode baseline controls.

## Guardrail profile management

- Use staged rollout: dry-run -> pilot -> broad rollout.
- Version all guardrail profiles.
- Require signed approvals for strictness reductions.

## Policy operations

- Test policies using replay fixtures before production activation.
- Monitor false-positive and false-negative rates.
- Maintain exception waivers with expiry and owner.

## Multi-tenant controls

- Enforce tenant isolation boundaries.
- Audit cross-tenant access attempts.
- Configure tenant-specific data and model provider constraints.

## Deployment mode operations

- Self-hosted: validate install hardening, upgrade path, backup/restore, and network controls.
- SaaS: validate tenant provisioning, quotas, and noisy-neighbor protections.
- For both modes: run tenant isolation conformance tests before production go-live.

## Release readiness checks

- Conformance matrix all green.
- Benchmark gates meet minimum 3.0x multipliers.
- Critical blockers and open waivers are within policy.
