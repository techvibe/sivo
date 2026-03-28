#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RULE_FILE="$ROOT/.cursor/rules/resume-and-handoff.mdc"
STATE_FILE="$ROOT/plans/specs/cursor_resume_state.yaml"
BACKLOG_FILE="$ROOT/plans/specs/spec_task.backlog.yaml"

echo "Checking resume mechanism files..."
[[ -f "$RULE_FILE" ]] || { echo "Missing rule file: $RULE_FILE"; exit 1; }
[[ -f "$STATE_FILE" ]] || { echo "Missing state file: $STATE_FILE"; exit 1; }
[[ -f "$BACKLOG_FILE" ]] || { echo "Missing backlog file: $BACKLOG_FILE"; exit 1; }

echo "Validating state and deriving next task..."
ruby - "$STATE_FILE" "$BACKLOG_FILE" <<'RUBY'
require "yaml"

state_path = ARGV[0]
backlog_path = ARGV[1]
state = YAML.load_file(state_path)
backlog = YAML.load_file(backlog_path)

raise "state missing current_task_id" unless state["current_task_id"]
raise "backlog missing tasks" unless backlog["tasks"].is_a?(Array) && !backlog["tasks"].empty?

task_index = backlog["tasks"].map { |t| [t["task_id"], t] }.to_h
current_id = state["current_task_id"]
current = task_index[current_id]
raise "current_task_id not found in backlog: #{current_id}" unless current

if state["current_task_status"] == "in_progress"
  selected = current_id
else
  planned = backlog["tasks"].select { |t| t["status"] == "planned" }
  unblocked = planned.select do |t|
    deps = t["dependencies"] || []
    deps.all? { |dep| task_index[dep] && task_index[dep]["status"] == "completed" }
  end
  sorted = unblocked.sort_by do |t|
    level = t.dig("priority", "level")
    score = t.dig("priority", "score") || 0
    level_weight = {"critical" => 0, "high" => 1, "medium" => 2, "low" => 3}.fetch(level, 4)
    [level_weight, -score]
  end
  selected = sorted.first&.fetch("task_id", nil) || current_id
end

puts "Resume current_task_id: #{current_id}"
puts "Resolved next task: #{selected}"
puts "Verification result: PASS"
RUBY

echo "Cursor resume mechanism verification passed."
