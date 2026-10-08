# MCP design

## Architecture

```text
Rider / Claude Code / other MCP host
                │
                ▼
       RefactoringFridays MCP
                │
       ┌────────┼────────┐
       ▼        ▼        ▼
 CodeMetrics  Git     Tests/Coverage
    .CLI
```

The first transport is stdio for low-latency local execution and no exposed network port.

## Design principles

- Read-only by default.
- Explicit workspace boundary.
- Stable normalized JSON independent of analyzer output details.
- Explainable decisions.
- Cached analysis keyed by revision and analyzer configuration.
- No generic shell execution tool.
- Mutating actions require explicit host approval.

## Tool contracts

### analyze_selection

```json
{
  "file": "src/Orders/OrderService.cs",
  "symbol": "CreateOrderAsync"
}
```

Returns normalized metrics, locations, risk factors, and analyzer provenance.

### create_baseline

```json
{
  "path": "src/Orders/OrderService.cs",
  "symbol": "CreateOrderAsync"
}
```

Returns a baseline identifier containing revision, analyzer version, metrics, and scope.

### compare_complexity

```json
{
  "path": ".",
  "baseRef": "main",
  "headRef": "HEAD"
}
```

Returns metric deltas and a decision based on the configured policy.

### validate_refactoring

```json
{
  "path": ".",
  "baselineId": "baseline-123",
  "runTests": true
}
```

Returns test results, metric deltas, API impact, and final evidence status.

## Normalized result

```json
{
  "schemaVersion": "1.0",
  "source": "CodeMetrics.CLI",
  "analyzerVersion": "unknown",
  "revision": "abc123",
  "scope": {
    "files": [],
    "symbols": []
  },
  "metrics": {},
  "risk": {
    "score": 0,
    "level": "low",
    "reasons": []
  },
  "decision": "observe"
}
```

## Future security tools

- `scan_change_security`
- `detect_secrets`
- `check_dependency_change`
- `check_authorization_impact`
- `check_data_flow_risk`
- `check_intent_mismatch`
