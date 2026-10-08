# RefactoringFridays

**Make agents prove their changes.**

RefactoringFridays is an evidence-based change safety layer for AI coding agents. It measures risky changes before editing, creates a baseline, guides a minimal change, and verifies the result afterward.

## Repository contents

- [Product requirements](PRD.md)
- [MCP design](docs/mcp-design.md)
- [Claude Code plugin](docs/claude-code-plugin.md)
- [Security guard backlog](docs/security-guards.md)
- [Landing page](landing/index.html)

## Core loop

```text
Observe → Baseline → Plan → Change → Test → Verify
```

## Planned integrations

- JetBrains Rider
- Claude Code
- MCP-compatible coding agents
- CodeMetrics.CLI

## Status

Product discovery and architecture skeleton. The analyzer adapter and MCP server implementation are not included yet.

## License

MIT
