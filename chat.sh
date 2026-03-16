#!/bin/bash
# StockAnalyzer 자연어 대화
# Usage: ./chat.sh "삼성전자 분석해줘"

set -e
source "$(dirname "$0")/common.sh"
check_api_key

if [ -z "$1" ]; then
  echo "Usage: $0 <message>" >&2
  echo "Example: $0 \"삼성전자 분석해줘\"" >&2
  exit 1
fi

MESSAGE=$(json_escape "$1")
api_post "/api/agent/chat" "{\"message\": ${MESSAGE}}"
