#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail() {
  echo "PQ-COVERAGE-FAIL: $1" >&2
  exit 1
}

require_file() {
  local file="$1"
  [[ -f "$file" ]] || fail "Missing required file: $file"
}

require_pattern() {
  local pattern="$1"
  local file="$2"
  rg -q "$pattern" "$file" || fail "Missing pattern '$pattern' in $file"
}

echo "Verifying required PQ files exist..."
require_file "$ROOT/plans/specs/sivo_post_quantum_crypto_v1.md"
require_file "$ROOT/plans/specs/post_quantum_crypto_profile_v1.yaml"
require_file "$ROOT/plans/specs/verification_gate_policy_v1.yaml"
require_file "$ROOT/plans/specs/sivo_protocol_v1.md"
require_file "$ROOT/plans/specs/sivo_enterprise_controls_v1.md"
require_file "$ROOT/plans/specs/sivo_deployment_and_tenancy_models_v1.md"
require_file "$ROOT/plans/specs/sivo_verification_and_execution_guarantees_v1.md"

echo "Verifying gate checks and artifacts include PQ controls..."
require_pattern "post_quantum_crypto_conformance" "$ROOT/plans/specs/verification_gate_policy_v1.yaml"
require_pattern "crypto_agility_rotation_drill" "$ROOT/plans/specs/verification_gate_policy_v1.yaml"
require_pattern "post_quantum_crypto_report" "$ROOT/plans/specs/verification_gate_policy_v1.yaml"

echo "Verifying protocol and enterprise specs include PQ requirements..."
require_pattern "post-quantum" "$ROOT/plans/specs/sivo_protocol_v1.md"
require_pattern "post-quantum|PQ-hybrid|hybrid PQ" "$ROOT/plans/specs/sivo_enterprise_controls_v1.md"
require_pattern "Post-quantum-hybrid" "$ROOT/plans/specs/sivo_deployment_and_tenancy_models_v1.md"
require_pattern "post-quantum" "$ROOT/plans/specs/sivo_verification_and_execution_guarantees_v1.md"

echo "Verifying profile has hybrid signature and transport components..."
require_pattern "signature_profiles" "$ROOT/plans/specs/post_quantum_crypto_profile_v1.yaml"
require_pattern "pq_mldsa_" "$ROOT/plans/specs/post_quantum_crypto_profile_v1.yaml"
require_pattern "pq_mlkem_" "$ROOT/plans/specs/post_quantum_crypto_profile_v1.yaml"
require_pattern "protected_environments_require_hybrid: true" "$ROOT/plans/specs/post_quantum_crypto_profile_v1.yaml"

echo "Verifying backlog contains PQ foundation task..."
require_pattern "SIVO-TASK-PQ_CRYPTO_FOUNDATION" "$ROOT/plans/specs/spec_task.backlog.yaml"

echo "PQ coverage verification passed."
