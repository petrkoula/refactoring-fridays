# RefactoringFridays — Product Requirements Document

## 1. Product summary

RefactoringFridays is a local, MCP-based evidence gate for AI-generated code changes. It helps coding agents change existing code without relying on blind trust.

> **Don’t ship AI code on trust. Make agents prove their changes.**

The product measures the target before an edit, creates a baseline, requires a proportionate plan for risky changes, and verifies the result using tests and code metrics.

## 2. Problem

AI coding agents are fast at modifying code, but they can also introduce unverified complexity, hidden behavior, security regressions, dependency risk, and technical debt. Existing tools usually focus on one of three points:

- IDE refactoring and inspections.
- Repository or CI quality gates.
- Review after a change has already been created.

RefactoringFridays focuses on the missing workflow: evidence before and after an agent changes a specific piece of code.

## 3. Product thesis

The product does not promise that AI will never make a mistake. It makes risk visible, requires evidence before risky edits, and verifies what happened afterward.

Core principle:

```text
No baseline, no risky edit. No verification, no done.
```

## 4. Target users

- C#/.NET developers using JetBrains Rider.
- Teams adopting Claude Code or other coding agents.
- Platform engineers defining agent guardrails.
- Teams maintaining legacy systems.
- Security-conscious teams that need auditable AI changes.

## 5. Product scope

### Core

- CodeMetrics.CLI integration.
- Cognitive and cyclomatic complexity.
- Method and class size.
- Git change frequency.
- Test and coverage context.
- Dependency and public API impact.
- Baselines and before/after comparisons.
- Explainable risk score.
- MCP tools, resources, and prompts.
- Claude Code skill and hooks.
- Rider tool window, editor hints, and diff integration.

### Trust Guard backlog

- Secret detection.
- Suspicious outbound network behavior.
- Dependency and supply-chain risk.
- Authorization regression checks.
- Data exfiltration signals.
- Intent mismatch detection.
- Dirty-code and bypass patterns.
- Evidence provenance and integrity chain.

## 6. Core workflow

```text
1. Observe — identify changed files and symbols.
2. Baseline — measure the current state.
3. Plan — create a small, risk-appropriate plan.
4. Change — apply an approved patch.
5. Test — run relevant tests.
6. Verify — re-measure and compare the result.
```

## 7. Risk model

The initial model should be deterministic and explainable:

```text
risk = complexity + churn + uncovered behavior + dependency impact + API impact
```

Every score must expose its reasons. A single metric must never automatically determine quality.

## 8. MCP tools

Initial tools:

- `analyze_workspace`
- `analyze_selection`
- `get_complexity_hotspots`
- `create_baseline`
- `compare_complexity`
- `suggest_refactoring_plan`
- `validate_refactoring`
- `scan_change_security` (Trust Guard)

Initial resources:

- `roder://complexity/workspace-summary`
- `roder://complexity/hotspots`
- `roder://complexity/file/{path}`
- `roder://complexity/baseline/{id}`
- `roder://complexity/diff`

Initial prompts:

- `review-current-change`
- `find-refactoring-opportunities`
- `explain-selected-code`
- `safe-refactor`

## 9. Claude Code behavior

The plugin provides:

- a `complexity-first` skill,
- `PreToolUse` guard for Edit, Write, and MultiEdit,
- `PostToolUse` verification,
- advisory, guarded, and strict modes,
- structured remediation instructions when an edit is blocked.

## 10. Rider behavior

The Rider plugin should provide:

- editor complexity hints,
- hotspot gutter markers,
- a Complexity tool window,
- current-selection analysis,
- complexity-aware Git diff,
- Refactor and Verify action,
- complexity budget settings.

## 11. MVP acceptance criteria

- A local MCP server runs through stdio.
- CodeMetrics.CLI output is normalized into stable JSON.
- A selected C# method can be analyzed quickly.
- A baseline can be created and compared.
- A risky edit can be warned about or blocked.
- Relevant tests can be run after an edit.
- The final report contains before/after metrics, tests, API impact, and decision.
- No source code leaves the local workspace by default.

## 12. Non-goals

- Replacing Rider's native refactoring engine.
- Replacing SonarQube, NDepend, or a full SAST platform.
- Guaranteeing that all vulnerabilities or backdoors are detected.
- Building a general-purpose AI coding agent.

## 13. Roadmap

### P0

MCP server, CodeMetrics.CLI adapter, baseline, risk score, Claude Code plugin, pre-edit guard, post-edit verification.

### P1

Rider plugin, complexity-aware diff, Git churn, coverage, SARIF, CI action, complexity budgets.

### P2

Mutation testing, architecture checks, Trust Guard, evidence provenance, private policies.

### P3

Central dashboard, organization policy packs, signed evidence, enterprise audit.
