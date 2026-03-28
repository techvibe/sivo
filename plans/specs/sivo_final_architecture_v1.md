# Sivo Final Architecture v1

Version: `1.0.0`  
Status: Draft for implementation  
Owner: Sivo core architecture

## SIVO-ARCH-001 Product architecture objective

Sivo MUST act as the primary AI-native SCM substrate while maintaining permanent Git dual-mode compatibility for ecosystem interoperability.

### Acceptance criteria
- System architecture clearly identifies a Sivo source-of-truth plane and a Git compatibility plane.
- All core product workflows (plan, change, verify, promote) execute without requiring users to invoke Git primitives directly.
- Git projection remains available for all sealed sessions.
- Language/runtime strategy follows `sivo_language_and_runtime_strategy_v1.md` with Rust core and polyglot API access.

## SIVO-ARCH-002 Control and data planes

Sivo architecture is partitioned into:
- Control plane: policy, identity, orchestration, dashboard, conformance.
- Data plane: protocol events, storage engine, memory index, projections.

### Acceptance criteria
- Plane boundaries are explicit in implementation modules and API endpoints.
- Data-plane operations are deterministic and replayable from event logs.
- Control-plane failures do not corrupt data-plane append-only history.

## SIVO-ARCH-003 Core components

- `IntentPlanner`: translates user/agent objectives into executable workflow intents.
- `PolicyEngine`: deterministic policy evaluation over normalized events.
- `SessionCoordinator`: claim, lock, merge, and conflict orchestration.
- `EventLog`: append-only lineage ledger with signed seals.
- `MultifolderStorageCore`: optimized storage layout for code, semantics, artifacts.
- `GitDualModeProjection`: deterministic projection and reconcile with Git hosts.
- `DashboardService`: engineering completeness and enterprise posture views.
- `LearningOrchestrator`: customer-scoped recommendation and adaptation engine.
- `BacklogStateManager`: native backlog storage, prioritization, and execution orchestration.

### Acceptance criteria
- Every component has an API contract and health check.
- Component-to-component calls are traceable by `session_id` and `trace_id`.
- A component failure matrix is documented and covered in integration tests.
- LearningOrchestrator cannot bypass deterministic policy enforcement path.

## SIVO-ARCH-004 Deterministic lifecycle

Lifecycle phases: `propose -> claim -> mutate -> verify -> seal -> promote`.

### Acceptance criteria
- Transitions are state-machine validated and reject illegal transitions.
- Same event stream under same policy version produces identical terminal state.
- Seal operation includes hash-chain anchor and signature bundle.

## SIVO-ARCH-005 AI memory and guardrail coupling

Memory writes and policy checks MUST be first-class operations in the lifecycle.

### Acceptance criteria
- Every autonomous mutation references memory context and policy decision IDs.
- Guardrail verdicts are persisted and linked to resulting state changes.
- Replay can reconstruct both data state and decision rationale.

## SIVO-ARCH-006 Enterprise deployment modes

Supported modes:
- Local developer mode
- Team-managed control plane
- Enterprise multi-tenant managed deployment
- Enterprise self-hosted deployment (private/public cloud)
- Managed SaaS multi-tenant deployment

### Acceptance criteria
- Mode-specific configuration profiles are documented and testable.
- RBAC enforcement is consistent across deployment modes.
- Data residency settings are enforceable per tenant for enterprise mode.
- Deployment contracts align with `sivo_deployment_and_tenancy_models_v1.md`.

## SIVO-ARCH-007 Availability and resilience

### Acceptance criteria
- RPO and RTO targets are defined for event log and metadata stores.
- Backup/restore procedure exists and is validated in DR exercises.
- Partition and reconnect behavior is deterministic and audit-safe.

## SIVO-ARCH-008 Native backlog and planning surface

Sivo MUST provide first-class planning/backlog capabilities integrated with SCM lifecycle.

### Acceptance criteria
- Backlog entities are stored in Sivo state and linked to sessions and seals.
- Prioritization and dependency management are exposed via API, CLI, and dashboards.
- External backlog adapters remain optional coexistence features.
