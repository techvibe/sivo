# Sivo Specs Index (Final Product)

This directory contains the executable product specification for Sivo as an AI-native SCM.

## Canonical documents

- `sivo_final_architecture_v1.md`
- `sivo_protocol_v1.md`
- `sivo_storage_multifolder_v1.md`
- `sivo_git_dualmode_contract_v1.md`
- `sivo_ai_memory_and_guardrails_v1.md`
- `sivo_agent_autonomy_contract_v1.md`
- `sivo_dashboard_and_completeness_v1.md`
- `sivo_enterprise_controls_v1.md`
- `sivo_perf_benchmark_suite_v1.md`
- `sivo_cli_api_surface_v1.md`
- `sivo_migration_playbook_v1.md`
- `dualmode_storage_protocol_conformance_matrix_v1.md`
- `sivo_verification_and_execution_guarantees_v1.md`
- `sivo_learning_and_adaptation_v1.md`
- `sivo_backlog_state_manager_v1.md`
- `sivo_intent_bdd_execution_contract_v1.md`
- `sivo_production_quality_and_usability_v1.md`
- `sivo_deployment_and_tenancy_models_v1.md`
- `sivo_architecture_decision_and_evidence_v1.md`
- `sivo_exception_and_outlier_guardrails_v1.md`
- `sivo_redteam_diff_canary_and_breakglass_v1.md`

## Global acceptance rule

Every spec section has:
- a stable section ID (`SIVO-...`)
- normative requirements (`MUST`, `SHOULD`, `MAY`)
- acceptance criteria that can be encoded in tests, policy checks, or dashboard completeness calculations

## Execution contracts

- Agent backlog schema: `spec_task.schema.yaml`
- Canonical task envelope: `spec_task.yaml`
- Example executable backlog: `spec_task.backlog.yaml`
- Dashboard event schema: `dashboard_data_contract_v1.json`
- Completeness formula: `completeness_formula_v1.yaml`
- Verification gate policy: `verification_gate_policy_v1.yaml`
- ADR schema: `adr_record.schema.yaml`
- Execution safety profile: `execution_safety_profile_v1.yaml`
- Red-team corpus policy: `redteam_corpus_policy_v1.yaml`
- Differential safety matrix: `differential_safety_matrix_v1.yaml`
- Canary and break-glass policy: `canary_and_breakglass_policy_v1.yaml`
- Cursor resume state: `cursor_resume_state.yaml`
- Cursor resume protocol: `cursor_resume_protocol.md`
- Cursor bootstrap prompt: `cursor_bootstrap_prompt.md`

## Guides

- `guides/sivo_user_guide_v1.md`
- `guides/sivo_admin_guide_v1.md`
- `guides/sivo_operator_runbook_v1.md`
- `guides/sivo_steering_loop_guide_v1.md`
- `guides/sivo_cursor_build_workflow_v1.md`

## Verification utility

- `scripts/verify_cursor_resume.sh` validates resume mechanism integrity and next-task resolution.
