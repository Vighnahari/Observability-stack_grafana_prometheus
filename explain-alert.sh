#!/bin/bash
# explain-alert.sh — feeds a PromQL query or log line to a local Ollama model
# and returns a plain-English explanation. Usage:
#   ./explain-alert.sh "your promql expression or log line here"

if [ -z "$1" ]; then
  echo "Usage: ./explain-alert.sh \"<promql expression or log line>\""
  exit 1
fi

INPUT="$1"

ollama run phi3:mini "Explain this observability data to a junior DevOps engineer in simple, plain terms. If it's a PromQL expression, explain what condition triggers it and why it matters. If it's a log line, explain what happened and whether it looks normal or concerning:

$INPUT"
