# Sivo User Guide v1

## Who this guide is for

Developers and AI-tool users collaborating through Sivo-native workflows.

## Core user workflow

1. Create or select initiative/task in Sivo backlog.
2. Start a Sivo session with clear objective and scope.
3. Let AI agent propose and apply changes under guardrails.
4. Review validation, provenance, and benchmark impact.
5. Seal and promote when policy gates pass.

## Key user commands (CLI)

- `sivo session create`
- `sivo backlog task create`
- `sivo backlog task prioritize`
- `sivo delta apply`
- `sivo validate run`
- `sivo seal`
- `sivo promote`

## Working with AI agents safely

- Always define scope and policy envelope.
- Require approval for high-risk changes.
- Use `--json` outputs for automation and evidence capture.

## Understanding dashboards

- Completeness score tracks implementation maturity.
- Blocker panels show policy, conformance, and performance risks.
- Backlog queue view shows priorities, dependencies, and cycle time.

## Troubleshooting basics

- If blocked by policy, inspect `policy_verdict_recorded` events.
- If blocked by drift, inspect dual-mode drift diagnostics.
- If blocked by benchmarks, inspect gate policy and regressions.
