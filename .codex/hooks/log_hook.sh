#!/usr/bin/env bash
set -euo pipefail
PAYLOAD="$1"
LOG="$HOME/.codex/hook-log.jsonl"

# Append payload to our local log file with a timestamp (no stop decision output).
TS=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "{\"ts\":\"$TS\",\"payload\":$PAYLOAD}" >> "$LOG"
