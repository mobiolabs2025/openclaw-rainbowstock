#!/bin/bash
# StockAnalyzer 투자 성과 분석
# Usage: ./performance.sh [--formatted]

set -e
source "$(dirname "$0")/common.sh"
check_api_key

if [ "$1" = "--formatted" ] || [ "$1" = "-f" ]; then
  api_get "/api/internal/agent/performance/formatted"
else
  api_get "/api/internal/agent/performance"
fi
