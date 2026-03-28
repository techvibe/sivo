# Cursor Resume Protocol

## Purpose

Ensure any Cursor session on any cloned machine can continue from the last known state without losing guardrails.

## Source of truth

- Runtime handoff state: `cursor_resume_state.yaml`
- Execution backlog: `spec_task.backlog.yaml`
- Safety and verification gates: `verification_gate_policy_v1.yaml`, `execution_safety_profile_v1.yaml`
- Command mapping: `cursor_prompt_commands.yaml` and `prompts/*.prompt.md`

## Resume algorithm

1. Read `cursor_resume_state.yaml`.
2. If `current_task_status` is `in_progress`, continue `current_task_id`.
3. Else choose highest-priority unblocked `planned` task from `spec_task.backlog.yaml`.
4. Validate required task fields: intent, BDD, ADR, empirical plan, usability criteria.
5. Execute under policy envelope and update state after each meaningful milestone.

## Required state update cadence

Update `cursor_resume_state.yaml` at:
- task start
- gate stage completion/failure
- blocker creation/removal
- task completion
- session end

## Session-end handoff checklist

- `last_update_utc` refreshed
- `current_task_id` and `current_task_status` accurate
- `next_task_candidates` sorted by dependency + priority
- `gate_status` current
- `blockers` and `latest_artifacts` populated

## Shortcut command usage

You can use either:
- Cursor chat shortcuts: `start`, `resume`, `restart`
- Terminal wrappers: `scripts/start`, `scripts/resume`, `scripts/restart`

Optional:
- `--copy` copies the mapped prompt to clipboard when supported.
- `scripts/restart --apply-restart` resets `cursor_resume_state.yaml` to foundation defaults.
