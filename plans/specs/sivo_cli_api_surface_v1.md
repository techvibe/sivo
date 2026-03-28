# Sivo CLI and API Surface v1

Version: `1.0.0`  
Status: Normative

## SIVO-API-001 Surface objective

Provide stable, RBAC-secured CLI and API interfaces for all core Sivo workflows and enterprise controls.

### Acceptance criteria
- Every core protocol operation has API and CLI coverage.
- RBAC authorization is enforced consistently across interfaces.
- Output contracts are machine-readable and versioned.

## SIVO-API-002 API principles

- REST/JSON for management and query workflows.
- Streaming/event endpoints for live progress and alerts.
- Idempotency and pagination as first-class requirements.

### Acceptance criteria
- API supports idempotency keys for create/project/push workflows.
- Error model includes deterministic codes and retryability hints.
- OpenAPI spec is versioned and published.

## SIVO-API-003 Core endpoints (minimum set)

- `/v1/sessions`
- `/v1/claims`
- `/v1/deltas`
- `/v1/validations`
- `/v1/seals`
- `/v1/projections`
- `/v1/history/query`
- `/v1/memory/query`
- `/v1/policy/evaluate`
- `/v1/dashboard/*`
- `/v1/benchmarks/*`
- `/v1/backlog/*`
- `/v1/learning/*`

### Acceptance criteria
- Endpoint schemas align with protocol object schemas.
- Backward-compatible additive evolution is enforced.
- Endpoint-level authz scopes are documented and tested.

## SIVO-API-004 CLI contract (minimum verbs)

- `sivo session create|show|seal`
- `sivo claim request|list`
- `sivo delta apply`
- `sivo validate run`
- `sivo project git|sivo`
- `sivo push`
- `sivo history query`
- `sivo memory query`
- `sivo policy check`
- `sivo dashboard export`
- `sivo backlog initiative|epic|task create|list|update|close`
- `sivo backlog prioritize`
- `sivo learning profile set|get`
- `sivo learning recommendations list|apply`

### Acceptance criteria
- CLI commands return stable structured output mode (`--json`).
- Non-zero exit codes map to API error classes.
- CLI supports non-interactive automation mode.
- Backlog and learning commands are policy-gated and RBAC-scoped.

## SIVO-API-005 RBAC and tokens

### Acceptance criteria
- Token scopes align to endpoint and command permissions.
- Impersonation/delegation requires explicit, audited entitlement.
- Expired/revoked tokens fail closed.

## SIVO-API-006 Integration hooks

### Acceptance criteria
- Webhooks/events are available for task, policy, benchmark, and migration changes.
- MCP adapter parity with API operations is validated.
- Rate limits and quotas are documented and enforceable.
