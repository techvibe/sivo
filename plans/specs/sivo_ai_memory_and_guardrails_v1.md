# Sivo AI Memory and Guardrails v1

Version: `1.0.0`  
Status: Normative

## SIVO-MEM-001 Memory objective

Sivo memory MUST provide durable, queryable context for AI tools that is deterministic, auditable, and policy-bounded.

### Acceptance criteria
- Memory APIs support write/read/query by repository, session, entity, and time.
- Memory retrieval can be replayed to produce equivalent evidence slices.
- Memory access is gated by RBAC and policy decisions.

## SIVO-MEM-002 Memory model

`memory_entry` types:
- `intent`
- `decision`
- `evidence`
- `constraint`
- `outcome`
- `exception`

### Acceptance criteria
- Each entry includes `entry_id`, `session_id`, `actor_id`, `timestamp`, `type`, `payload_hash`, `policy_ref`.
- Payload schemas are versioned and backward-compatible for additive changes.
- Invalid entry schemas are rejected with deterministic error codes.

## SIVO-MEM-003 Deterministic retrieval

Retrieval pipeline MUST separate ranking heuristics from deterministic filter and eligibility stages.

### Acceptance criteria
- Eligibility filtering by policy/tenant/scope is deterministic.
- Ranking strategy version is persisted with query result metadata.
- Replay mode can bypass nondeterministic ranking and return canonical order.

## SIVO-MEM-004 Guardrail engine contract

Guardrails evaluate normalized events, not raw model-specific traces.

### Acceptance criteria
- Policy inputs are normalized into stable event schema.
- Guardrail verdicts include rule IDs, evidence links, and final action (`allow`, `deny`, `require_review`).
- Guardrail decision logs are immutable and linked to mutation IDs.

## SIVO-MEM-005 Model/provider neutrality

Memory and guardrails MUST remain provider-neutral across LLMs and agent frameworks.

### Acceptance criteria
- Vendor-specific fields are stored in extension namespaces.
- Core correctness is independent of vendor-specific metadata presence.
- Cross-provider session tests produce equivalent guardrail outcomes.

## SIVO-MEM-006 Privacy and retention

### Acceptance criteria
- Sensitive data tagging and redaction policies are supported at write time.
- Retention profiles are enforceable by tenant and repository class.
- Legal hold mode prevents destructive retention actions until released.

## SIVO-MEM-007 Evidence and attestation linkage

### Acceptance criteria
- Every promoted change references a complete evidence bundle.
- Evidence bundles can be verified independently from source systems.
- Missing evidence is promotion-blocking unless explicitly policy-exempted.
