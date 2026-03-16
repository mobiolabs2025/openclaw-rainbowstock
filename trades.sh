#!/bin/bash
# StockAnalyzer 거래 내역 조회
# Usage: ./trades.sh [--formatted] [days]

set -e
source "$(dirname "$0")/common.sh"
check_api_key

if [ "$1" = "--formatted" ] || [ "$1" = "-f" ]; then
  api_get "/api/internal/agent/trades/formatted"
else
  DAYS="${1:-30}"
  api_get "/api/internal/agent/trades?days=${DAYS}"
fi
