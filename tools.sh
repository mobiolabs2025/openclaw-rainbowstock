#!/bin/bash
# RainbowStock - Tool Definitions 조회
source "$(dirname "$0")/common.sh"

curl -s "${SA_API_URL}/api/openclaw/tools" \
  -H "Authorization: Bearer ${SA_API_KEY}" \
  -H "Content-Type: application/json"
