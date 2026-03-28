# Sivo Plans

This folder is the working project space for Sivo strategy, protocol, and delivery planning.

## Documents

- `ai-centric_scm_vision_9050f762.plan.md` - Integrated AI-centric SCM vision with Sivo as the core protocol/product layer.
- `sivo_plan_context_v1.md` - Canonical `plan_context` contract used by humans and agents.
- `sivo_protocol_v0.md` - Multi-model Sivo protocol primitives and operation contract.
- `sivo_git_compatibility_profile.md` - Deterministic Git interoperability guarantees and conformance profile.
- `sivo_customer_agent.md` - Evolution steward agent loop to keep roadmap non-breaking and adaptive.
- `specs/README.md` - Final-product executable spec index for architecture, protocol, storage, dual-mode, enterprise, and performance gates.
- `specs/sivo_verification_and_execution_guarantees_v1.md` - Verify-first autonomous execution guarantees and no-gap release criteria.
- `specs/sivo_learning_and_adaptation_v1.md` - Customer-configurable continuous learning and guardrail boundaries.
- `specs/sivo_backlog_state_manager_v1.md` - Native backlog and prioritization model to reduce external planning tool dependence.
- `specs/sivo_production_quality_and_usability_v1.md` - Production-grade quality gates and customer usability acceptance contract.
- `specs/sivo_deployment_and_tenancy_models_v1.md` - Self-hosted and SaaS deployment/tenancy guarantees for enterprise.
- `specs/sivo_architecture_decision_and_evidence_v1.md` - Architecture decision records linked to empirical test evidence.
- `specs/cursor_resume_state.yaml` - Repository-native Cursor handoff state for cross-machine resume.
- `specs/cursor_bootstrap_prompt.md` - Portable prompt to resume execution from the last known state.

## Suggested workflow

1. Start with `ai-centric_scm_vision_9050f762.plan.md`.
2. Author and evolve implementation-ready specs under `specs/` with stable section IDs and acceptance criteria.
3. Use `specs/spec_task.schema.yaml` and `specs/spec_task.backlog.yaml` as machine-readable agent execution inputs.
4. Use `.cursor/rules/resume-and-handoff.mdc` + `specs/cursor_resume_state.yaml` to continue from the previous session on any machine.
5. Run `scripts/verify_cursor_resume.sh` before publishing/handing off.
6. Update protocol or compatibility docs in small, additive revisions.
7. Run the stewardship loop in `sivo_customer_agent.md` weekly.

## Legacy reference kept

- Legacy path retained for compatibility: `/Users/sreenivas/.cursor/plans/ai-centric_scm_vision_9050f762.plan.md`
- Active editing path remains: `/Users/sreenivas/sivo/plans/ai-centric_scm_vision_9050f762.plan.md`
