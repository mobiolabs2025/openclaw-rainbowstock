#!/bin/bash
# StockAnalyzer 포트폴리오 조회
# Usage: ./portfolio.sh [--formatted]

set -e
source "$(dirname "$0")/common.sh"
check_api_key

if [ "$1" = "--formatted" ] || [ "$1" = "-f" ]; then
  api_get "/api/internal/agent/portfolio/formatted"
else
  api_get "/api/internal/agent/portfolio"
fi
