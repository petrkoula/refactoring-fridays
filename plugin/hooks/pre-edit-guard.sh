#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"
mode="${REFRACTORING_FRIDAYS_MODE:-advisory}"

# Skeleton only. A production implementation should call the cross-platform
# RefactoringFridays executable, validate the workspace, inspect the target,
# and return a structured block/remediation response when required.

if [[ "$mode" == "advisory" ]]; then
  exit 0
fi

if [[ -z "${CLAUDE_PROJECT_DIR:-}" ]]; then
  echo "RefactoringFridays: CLAUDE_PROJECT_DIR is missing" >&2
  [[ "$mode" == "strict" ]] && exit 2 || exit 0
fi

# TODO: invoke refactoring-fridays guard --input "$input"
exit 0
