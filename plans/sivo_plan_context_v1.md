# Sivo Plan Context v1

## Purpose

`plan_context` is the canonical intent contract for every Sivo session. It is designed for both humans and AI agents so that planning, execution, and governance remain aligned across code, chat, voice, and other artifacts.

## Design goals

- Keep intent machine-readable and human-reviewable.
- Preserve compatibility through additive evolution.
- Prevent hidden scope creep during autonomous agent execution.
- Make every decision auditable and replayable.

## Schema (v1)

```json
{
  "plan_context_version": "1.0.0",
  "intent": {
    "problem": "string",
    "goal": "string",
    "non_goals": ["string"]
  },
  "scope": {
    "repositories": ["string"],
    "modules": ["string"],
    "symbols": ["string"],
    "modalities": ["code", "chat", "voice", "docs", "other"]
  },
  "constraints": {
    "policy": ["string"],
    "compliance": ["string"],
    "runtime": ["string"],
    "rollout_safety": ["string"]
  },
  "compatibility_target": {
    "git_profile": "v1",
    "external_systems": ["github", "gitlab", "bitbucket", "other"]
  },
  "evolution_policy": {
    "compatibility_mode": "strict|graceful",
    "deprecation_window_days": 365,
    "fallback_required": true
  },
  "success_criteria": {
    "functional": ["string"],
    "dx": ["string"],
    "governance": ["string"],
    "reliability": ["string"]
  }
}
```

## Validation rules

- `plan_context_version` is required and semver.
- `intent.goal` must be non-empty.
- At least one `scope.modalities` value must be present.
- `compatibility_target.git_profile` is mandatory for any workflow that projects to Git.
- `evolution_policy.fallback_required` must be true for production sessions.
- Production workflows SHOULD declare required cryptographic profile class in `constraints.policy` (for example: post-quantum-hybrid required).

## Evolution policy

- New fields must be additive and optional in minor versions.
- Required field additions are major versions only.
- Unknown fields must be preserved on read/write (forward compatibility).
- Sessions can carry one `plan_context` version only; bridges handle translation.

## Example: Sivo integrated planning session

```json
{
  "plan_context_version": "1.0.0",
  "intent": {
    "problem": "Fragmented SCM semantics across code and agent conversations",
    "goal": "Use Sivo as the AI-native SCM protocol while preserving Git interoperability",
    "non_goals": ["Breaking existing Git host workflows"]
  },
  "scope": {
    "repositories": ["ai-centric-scm-vision"],
    "modules": ["protocol", "docs", "interop"],
    "symbols": ["session", "claim_scope", "seal"],
    "modalities": ["code", "chat", "docs"]
  },
  "constraints": {
    "policy": ["Signed attestations required for release-bound changes"],
    "compliance": ["SLSA aligned provenance"],
    "runtime": ["Deterministic Git projection"],
    "rollout_safety": ["Additive-only schema changes in v1 line"]
  },
  "compatibility_target": {
    "git_profile": "v1",
    "external_systems": ["github", "gitlab", "bitbucket"]
  },
  "evolution_policy": {
    "compatibility_mode": "graceful",
    "deprecation_window_days": 365,
    "fallback_required": true
  },
  "success_criteria": {
    "functional": ["Round-trip import/export works with no metadata loss in supported profile"],
    "dx": ["Agent and developer can run same workflow with or without direct CLI use"],
    "governance": ["Policy and approval events are signed and replayable"],
    "reliability": ["No hard breaking change in minor versions"]
  }
}
```
