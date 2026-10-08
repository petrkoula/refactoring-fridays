---
name: complexity-first
description: Use before modifying existing production code. Analyze complexity, create a baseline, and verify the result after editing.
---

# Complexity-first workflow

Before modifying existing production code:

1. Identify affected files and symbols.
2. Call `analyze_selection` or `analyze_workspace`.
3. Create a baseline with `create_baseline`.
4. Explain the relevant risk factors.
5. Create a small refactoring or implementation plan.
6. Preserve public APIs unless the user explicitly allows changes.
7. Apply the smallest safe change.
8. Run relevant tests.
9. Call `validate_refactoring`.
10. Report before/after metrics, tests, API changes, and remaining risk.

Do not edit solely because a metric is high. Consider complexity, churn, coverage, dependencies, and business impact.

If analysis is unavailable, explain the limitation and ask whether to continue in the configured mode.
