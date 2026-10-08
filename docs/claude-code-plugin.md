# Claude Code plugin skeleton

## Purpose

The plugin adds an evidence-first workflow to Claude Code. Instructions teach the workflow; hooks enforce it before risky edits.

## Layout

```text
plugin/
├── .claude-plugin/plugin.json
├── .mcp.json
├── skills/complexity-first/SKILL.md
└── hooks/
    ├── hooks.json
    ├── pre-edit-guard.sh
    └── post-edit-verify.sh
```

## Modes

- `observe`: collect evidence without blocking.
- `warn`: show a warning and continue.
- `guarded`: require analysis and a plan for high-risk changes.
- `strict`: no baseline and no verification means no completion.

The hook should remain fast by analyzing the affected file or symbols and using cached workspace results whenever possible.

## Installation concept

The plugin will eventually be distributed through a Claude Code plugin marketplace or installed from this repository. The `.mcp.json` registers the local RefactoringFridays MCP server.

## Important limitation

The initial shell hooks are a skeleton. Production behavior should move into a cross-platform executable to handle Windows paths, JSON, timeouts, concurrency, and process isolation reliably.
