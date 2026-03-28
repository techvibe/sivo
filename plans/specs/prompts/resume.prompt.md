Read `plans/specs/cursor_resume_state.yaml` and `plans/specs/spec_task.backlog.yaml`.

Resume exactly from `current_task_id` if status is `in_progress`; otherwise pick the highest-priority unblocked `planned` task.

Enforce `plans/specs/verification_gate_policy_v1.yaml` and `plans/specs/execution_safety_profile_v1.yaml`.

Update `cursor_resume_state.yaml` at each milestone and report progress with blockers, gate status, and evidence artifacts.
