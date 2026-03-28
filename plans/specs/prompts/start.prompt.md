Read `plans/specs/cursor_resume_state.yaml`, `plans/specs/spec_task.backlog.yaml`, and `plans/specs/verification_gate_policy_v1.yaml`.

Set execution to the first critical foundation task in strict dependency order:
1. `SIVO-TASK-INTENT_BDD_FOUNDATION`
2. `SIVO-TASK-OUTLIER_SAFETY_FOUNDATION`
3. `SIVO-TASK-ADV_HARDENING_FOUNDATION`
4. `SIVO-TASK-VERIFY_FOUNDATION`

Enforce intent+BDD+ADR+safety requirements, fail closed on anomalies, and update `cursor_resume_state.yaml` at each milestone with blockers, gate status, and evidence artifacts.
