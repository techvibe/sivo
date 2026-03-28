Reset execution state to foundation start, then begin from `SIVO-TASK-INTENT_BDD_FOUNDATION`.

Before work, update `plans/specs/cursor_resume_state.yaml` to:
- `current_phase: foundation_hardening`
- `current_task_id: SIVO-TASK-INTENT_BDD_FOUNDATION`
- `current_task_status: planned`
- clear `last_completed_tasks`, `blockers`, and `latest_artifacts`
- set all gate stages to `not_started`

Then enforce intent+BDD+ADR+safety controls and proceed under `plans/specs/verification_gate_policy_v1.yaml`.
