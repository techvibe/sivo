#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROMPTS_DIR="$ROOT/plans/specs/prompts"
STATE_FILE="$ROOT/plans/specs/cursor_resume_state.yaml"

usage() {
  echo "Usage: $0 <start|resume|restart> [--copy] [--apply-restart]"
}

copy_to_clipboard() {
  local text="$1"
  if command -v pbcopy >/dev/null 2>&1; then
    printf "%s" "$text" | pbcopy
    echo "Prompt copied to clipboard."
  else
    echo "Clipboard copy not supported on this machine. Prompt printed below."
    echo
    printf "%s\n" "$text"
  fi
}

apply_restart_state() {
  ruby - "$STATE_FILE" <<'RUBY'
require "yaml"
path = ARGV[0]
state = YAML.load_file(path)
state["last_update_utc"] = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
state["current_phase"] = "foundation_hardening"
state["current_task_id"] = "SIVO-TASK-INTENT_BDD_FOUNDATION"
state["current_task_status"] = "planned"
state["last_completed_tasks"] = []
state["next_task_candidates"] = [
  "SIVO-TASK-INTENT_BDD_FOUNDATION",
  "SIVO-TASK-OUTLIER_SAFETY_FOUNDATION",
  "SIVO-TASK-ADV_HARDENING_FOUNDATION",
  "SIVO-TASK-VERIFY_FOUNDATION"
]
state["blockers"] = []
state["latest_artifacts"] = []
state["gate_status"] = {
  "stage_1_spec_integrity" => "not_started",
  "stage_2_conformance_security" => "not_started",
  "stage_3_e2e_workflows" => "not_started",
  "stage_4_performance_resilience" => "not_started",
  "stage_5_release_decision" => "not_started"
}
File.write(path, state.to_yaml)
RUBY
  echo "Restart state applied to $STATE_FILE"
}

[[ $# -ge 1 ]] || { usage; exit 1; }
COMMAND="$1"
shift || true

COPY=false
APPLY_RESTART=false
for arg in "$@"; do
  case "$arg" in
    --copy) COPY=true ;;
    --apply-restart) APPLY_RESTART=true ;;
    *) echo "Unknown option: $arg"; usage; exit 1 ;;
  esac
done

case "$COMMAND" in
  start) PROMPT_FILE="$PROMPTS_DIR/start.prompt.md" ;;
  resume) PROMPT_FILE="$PROMPTS_DIR/resume.prompt.md" ;;
  restart) PROMPT_FILE="$PROMPTS_DIR/restart.prompt.md" ;;
  *) echo "Unknown command: $COMMAND"; usage; exit 1 ;;
esac

[[ -f "$PROMPT_FILE" ]] || { echo "Missing prompt file: $PROMPT_FILE"; exit 1; }
PROMPT_TEXT="$(<"$PROMPT_FILE")"

if [[ "$COMMAND" == "restart" && "$APPLY_RESTART" == true ]]; then
  apply_restart_state
fi

if [[ "$COPY" == true ]]; then
  copy_to_clipboard "$PROMPT_TEXT"
else
  echo "$PROMPT_TEXT"
fi
