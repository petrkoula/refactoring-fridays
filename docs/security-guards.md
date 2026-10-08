# Trust Guard backlog

These features are intentionally backlog items for the paid version. They are not part of the first complexity-focused MVP.

## Guard categories

### Secrets Guard

Detect API keys, tokens, passwords, private keys, connection strings, and credentials in changed files and generated configuration.

### Suspicious Behavior Guard

Flag new outbound network calls, dynamic execution, obfuscated strings, shell execution, startup persistence, time-based payloads, and unexpected external endpoints.

### Dependency Guard

Review new or changed packages, transitive dependencies, install scripts, registries, typosquatting signals, and approved dependency policy.

### Authorization Guard

Detect removed or weakened authentication, authorization, tenant isolation, CSRF, CORS, TLS, rate-limiting, and security middleware checks.

### Data Flow Guard

Flag new flows of secrets, personal data, source code, environment values, or request payloads to external systems or logs.

### Intent Mismatch Guard

Compare the task description with the actual behavioral impact of the patch.

### Dirty Code Guard

Flag hidden bypasses, disabled analyzers, skipped tests, swallowed exceptions, temporary debug paths, permissive defaults, and unexplained security suppressions.

## Safety wording

The product must not claim to detect every backdoor or malware payload. It should report suspicious and policy-violating behavior with evidence and confidence levels.

## Paid packaging

- Core: complexity, baseline, tests, coverage, refactoring verification.
- Trust Guard: secrets, suspicious behavior, dependencies, authorization, data flow, intent mismatch.
- Enterprise: private policies, blind gates, evidence provenance, signed evidence, central audit.
