# Sivo Steering Loop Guide v1

## Goal

Enable continuous user steering with non-linear prompts while keeping execution deterministic, policy-safe, and backlog-aligned.

## Steering model

Each new prompt is treated as a `steering_update` event with:
- intent delta
- priority delta
- scope delta
- risk delta
- acceptance delta

## Required steering workflow

1. Ingest prompt as structured steering update.
2. Validate policy and dependency impact.
3. Recompute impacted task intent contracts and BDD scenarios.
4. Re-prioritize backlog queue.
5. Emit dashboard updates and approval requirements.

## Guardrails

- Steering cannot bypass blocked verification stages.
- Scope expansion on critical tasks requires explicit approval.
- Contradictory steering prompts trigger clarification workflow.

## Visibility expectations

For every steering update, report:
- what changed
- what got reprioritized
- what got blocked/unblocked
- what evidence is still missing
- current readiness status to continue build
